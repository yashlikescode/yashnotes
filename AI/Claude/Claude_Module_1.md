### 1 Tokens are the unit of input, output, and cost.
Think and budget in tokens rather than words, since that is what the API meters and the context window measures.

### 2 The context window is a fixed token budget that holds the whole request at once.
An oversized input errors before generation, while hitting the ceiling mid-generation returns truncated output with a model_context_window_exceeded stop reason, so managing history is the application's job.

### 3 Sampling makes generation non-deterministic.
The same prompt can return different wording on each run, so testing on exact text is unreliable. This is what evals are built for.

### 4 Model choice and reasoning mode are separate, composable levers.
Pick the smallest model and the simplest reasoning and prompting that meet your eval and add capability only where the eval says you need it.

### 5 A developer reaches Claude over a REST API, usually through an SDK.
Choose between synchronous, streaming, async/await, or batch based on whether a user is waiting and whether the workload is real-time or bulk offline.