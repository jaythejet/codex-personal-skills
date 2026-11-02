# Common culprits — the boring causes of "impossible" bugs

Work through the sections relevant to your situation. Each item is phrased as a question you can answer with a quick check — actually run the check; don't answer from memory. These are ranked roughly by how often they turn out to be the answer.

## "My change has no effect" / "the fix didn't work"

- **Are you running the code you edited?** Print a unique marker (`print("VERSION 7")`, `console.log("v7")`) at the top of the changed file and confirm it appears. Wrong file, wrong copy of the repo, editor not saved, and stale build each cause this weekly.
- **Is a cache serving the old version?** Browser cache, service worker (PWAs aggressively cache old bundles — check DevTools → Application → Service Workers, or hard-reload / unregister), CDN cache, bundler cache, `__pycache__`. When in doubt, add the version marker and see which version answers.
- **Did the deploy actually go out — and finish?** Deploys queue and lag (Vercel can take 5+ minutes while showing nothing wrong). Verify by fetching the live asset and searching for a string unique to your change — not by assuming absence-of-error means deployed.
- **Is the process actually restarted?** Long-running servers keep old code in memory. Dev servers usually hot-reload; production processes, cron jobs, and workers don't.

## Data is wrong / totals don't add up / items missing

- **Does the data actually look like the code assumes?** Print a sample of the real records. The classic: most records are fine, a few have a different case ("fuv" vs "FUV"), extra whitespace, a different date format ("2026-7-5" vs "2026-07-05"), a string where a number is expected, or a missing field — and a `.get(key, 0)`/fallback silently swallows them.
- **Silent fallbacks.** Search the path for defaults that hide failure: `.get(x, 0)`, `|| 0`, `?? ""`, empty `catch`/`except`. Each one is a place where bad data passes through without a sound. Temporarily log when the fallback fires.
- **Filtering by string comparison?** Prefix matching, sorting, or comparing dates/numbers as strings breaks on format variation ("2026-07" won't match "2026-7-05").
- **Timezone / date boundaries.** A record stamped 11 PM local can be "tomorrow" in UTC. Bugs that appear only near midnight, month-end, or for certain users usually live here.
- **Duplicates or partial writes upstream.** If numbers are too high rather than missing, look for the same record ingested twice.

## Works for me, fails for someone else (or fails only in production)

- **Different data.** Their records exercise a branch yours never do (an event title format, a calendar name, an empty list, a color you never use). Get a copy or a screenshot of *their* actual data first.
- **Different auth/permission state.** Tokens cached from before a permission was granted, expired sessions, missing scopes. A 403/401 for one user and not another is nearly always token or scope history, not code.
- **Different environment.** Missing environment variable in production, different config, different device/browser (iOS PWAs especially restrict storage and background behavior).
- **Hardcoded values that are true only for you.** Your username, your calendar name, your file path, your locale baked into the code.

## Intermittent / random / timing-dependent

- **Async race:** code using a result before the fetch finishes. Intermittent = timing-dependent until proven otherwise. Look for missing `await`, unhandled promises, callbacks touching shared state.
- **Expiry:** tokens (~1 hour for Google access tokens), sessions, caches with TTLs. "Breaks after about an hour" is an expiry, full stop.
- **Retry/refresh loops** hiding a first-attempt failure that only sometimes recovers.
- **External service flakiness:** rate limits (429), transient 5xx. Check the network log for the *first* failing request, not the last.

## Crashes with null/undefined/None

- The null is the symptom. Ask what *produced* it: an API that returned an error object instead of data, a lookup with a key that doesn't exist, an optional field genuinely absent in some records, initialization order (using a value before it's set). Trace the value backward to its origin; don't guard the crash site.

## Config, environment, and dependencies

- **Environment variables:** missing, misspelled, set locally but not in the deploy platform, or changed without a restart. Print the ones you depend on (redact secrets — log presence/length, not the value).
- **Version drift:** a dependency updated with a breaking change; lockfile out of sync; local Node/Python version differs from production.
- **Case-sensitive paths:** macOS/Windows filesystems forgive case mismatches in imports and file paths; Linux (i.e., your deploy server) does not.

## Frontend/web specifics

- **Open the browser console first.** A blank page nearly always has a red error explaining itself. Check the Network tab for failed requests (4xx/5xx, CORS) and look at the response *body* — servers usually say what's wrong.
- **State vs. storage:** stale localStorage from an old version of the app (old schema, old keys) crashing new code. Inspect what's actually stored.
- **CORS errors** are configuration, not code logic — the server must allow the origin.
- **The error in the console may be downstream noise.** Fix the *first* error, then re-check; later errors are often collateral.
