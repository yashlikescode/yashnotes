# Graviton Research Capital - Python Interview Notes

**Role:** Application Reliability Engineer

**Preparation focus:** Python + DSA + Linux/Bash scripting + production debugging + reliability automation

---

## 1. What to Prioritize

For this role, Python should be prepared at three levels:

1. **Python fundamentals**
   - Types
   - Strings
   - Lists
   - Dictionaries
   - Sets
   - Tuples
   - Functions
   - OOP
   - Exceptions
   - Modules
   - Iterators/generators
   - Decorators
   - Python internals
2. **DSA/problem solving**
   - Arrays/lists
   - Strings
   - Hash maps
   - Sets
   - Stack
   - Queue
   - Heap
   - Sorting
   - Binary search
   - Two pointers
   - Sliding window
   - Complexity analysis
3. **Application reliability scripting**
   - Files and logs
   - Regex
   - JSON
   - Linux commands from Python
   - Environment variables
   - Logging
   - Subprocesses
   - Timeouts/retries
   - Production debugging
The supplied interview experience specifically mentions Python internals such as the GIL and monkey patching, along with DSA and Linux/scripting topics.

---

## 2. Variables and Dynamic Typing

Python is dynamically typed.

```python
x = 10
x = "hello"
```

The same variable name can reference objects of different types.

Python is also strongly typed:

```python
"10" + 5
# TypeError
```

Explicit conversion:

```python
"10" + str(5)
```

### Checking types

```python
type(x)
isinstance(x, int)
```

### Common built-in types

```
int
float
bool
str
list
tuple
set
dict
NoneType
```

---

## 3. Input and Output

`input()` returns a string.

```python
name = input()
age = int(input())
```

Space-separated integers:

```python
a, b, c = map(int, input().split())
```

List of integers:

```python
arr = list(map(int, input().split()))
```

Output:

```python
print("Hello")
print(a, b)
```

Useful options:

```python
print("a", "b", sep="-")
print("hello", end="")
```

Formatted strings:

```python
name = "Yash"
age = 26
print(f"{name} is {age} years old")
```

---

## 4. Operators

### Arithmetic

```python
+          # addition
-          # subtraction
*          # multiplication
/          # true division
//         # floor division
%          # remainder
**         # exponentiation
```

Examples:

```python
10 / 3         # 3.333...
10 // 3        # 3
10 % 3         # 1
2 ** 3         # 8
```

### Comparison

```python
==
!=
<
>
<=
>=
```

### Logical

```python
and
or
not
```

### Identity

```python
is
is not
```

Use is mainly for identity checks:

```python
if value is None:
    ...
```

### Membership

```python
in
not in
```

```python
if "ERROR" in line:
    ...
```

---

## 5. Conditional Statements

```python
if condition:
    ...
elif another_condition:
    ...
else:
    ...
```

Ternary expression:

```python
result = "positive" if x > 0 else "non-positive"
```

---

## 6. Loops

### for

```python
for x in arr:
    print(x)
```

With indexes:

```python
for i in range(len(arr)):
    print(i, arr[i])
```

Prefer `enumerate()` when possible:

```python
for i, value in enumerate(arr):
    print(i, value)
```

### range

```python
range(stop)
range(start, stop)
range(start, stop, step)
```

The stop value is excluded.

```python
list(range(5))
# [0, 1, 2, 3, 4]
```

### while

```python
while condition:
    ...
```

### break / continue / pass

```python
break           # terminate loop
continue        # skip current iteration
pass            # do nothing
```

---

## 7. Strings

Strings are ordered and immutable sequences.

```python
s = "python"
```

### Indexing

```python
s[0]
s[-1]
```

### Slicing

```python
s[start:stop:step]
```

Examples:

```python
s[1:4]
s[:4]
s[2:]
s[::-1]            # reverse
```

### Important string methods

```python
s.lower()
s.upper()
s.capitalize()
s.title()
s.strip()
s.lstrip()
s.rstrip()
s.split()
s.split(",")
separator.join(items)
s.replace("old", "new")
s.startswith("prefix")
s.endswith("suffix")
s.find("x")
s.rfind("x")
s.index("x")
s.count("x")
s.isalpha()
s.isdigit()
s.isalnum()
s.isspace()
```

### find() vs index()

```python
"abc".find("x")
# -1
```

```python
"abc".index("x")
# ValueError
```

### Efficient string construction

Instead of repeatedly doing:

```python
result = result + piece
```

prefer:

```python
parts = []
parts.append(piece)
result = "".join(parts)
```

---

## 8. Lists

A list is:

- Ordered
- Mutable
- Allows duplicates
- Supports indexing and slicing

```python
arr = [10, 20, 30]
```

### Access

```python
arr[0]
arr[-1]
arr[1:3]
```

### Major list methods

### Add

```python
arr.append(x)
```

Adds one item at the end.

```python
arr.extend(iterable)
```

Adds multiple items.

```python
arr.insert(index, value)
```

Inserts at a specific position.

### Remove

```python
arr.remove(value)
```

Removes the first matching value.

```python
arr.pop()
```

Removes and returns the last element.

```python
arr.pop(index)
```

Removes and returns an element at an index.

```python
arr.clear()
```

Removes all elements.

### Search

```python
arr.index(value)
arr.count(value)
```

### Ordering

```python
arr.sort()
arr.sort(reverse=True)
arr.reverse()
```

### Copy

```python
arr.copy()
arr[:]
```

---

## 9. List Complexity

Typical complexities:

| Operation | Complexity |
|---|---|
| arr[i] | O(1) |
| append() | O(1) amortized |
| pop() from end | O(1) |
| insert(0, x) | O(n) |
| pop(0) | O(n) |
| remove(x) | O(n) |
| x in arr | O(n) |
| sort() | O(n log n) |

This is why a list is usually good for a stack but not ideal for a queue.

---

## 10. List Comprehensions

Basic:

```python
squares = [x * x for x in range(10)]
```

With condition:

```python
even = [x for x in arr if x % 2 == 0]
```

Conditional expression:

```python
result = [
    "even" if x % 2 == 0 else "odd"
    for x in arr
]
```

Flatten a matrix:

```python
flat = [x for row in matrix for x in row]
```

---

## 11. Tuples

Tuple = ordered, immutable collection.

```python
point = (10, 20)
```

Access:

```python
point[0]
point[-1]
```

Unpacking:

```python
x, y = point
```

Multiple return values:

```python
def min_max(arr):
    return min(arr), max(arr)
mn, mx = min_max(arr)
```

One-element tuple:

```python
x = (10,)
```

The comma is required.

---

## 12. Sets

Sets store unique elements.

```python
s = {1, 2, 3}
```

Empty set:

```python
s = set()
```

{} creates an empty dictionary.

### Major set methods

```python
s.add(x)
s.update(iterable)
s.remove(x)
s.discard(x)
s.pop()
s.clear()
```

### Difference between remove and discard

```python
s.remove(x)
```

raises an error if x does not exist.

```python
s.discard(x)
```

does not raise an error if x does not exist.

### Set operations

```python
a | b
a & b
a - b
a ^ b
```

Equivalent methods:

```python
a.union(b)
a.intersection(b)
a.difference(b)
a.symmetric_difference(b)
```

Subset/superset:

```python
a.issubset(b)
a.issuperset(b)
```

Membership:

```python
x in s
```

Average complexity:

```
add            O(1)
remove         O(1)
lookup         O(1)
```

---

## 13. Dictionaries / Hash Maps

Dictionary stores key-value pairs.

```python
d = {
    "name": "Yash",
    "age": 26
}
```

Access:

```python
d["name"]
```

Safer access:

```python
d.get("name")
d.get("salary", 0)
```

### Major dictionary methods

```python
d.keys()
d.values()
d.items()
d.get(key)
d.get(key, default)
d.update(other)
d.pop(key)
d.pop(key, default)
d.popitem()
d.setdefault(key, default)
d.clear()
d.copy()
```

### Iteration

```python
for key in d:
    print(key)
```

```python
for value in d.values():
    print(value)
```

```python
for key, value in d.items():
    print(key, value)
```

### Membership

```python
key in d
```

Checks keys.

---

## 14. Dictionary Complexity

Average-case:

| Operation | Complexity |
|---|---|
| Lookup | O(1) |
| Insert | O(1) |
| Delete | O(1) |
| Membership | O(1) |

Important interview answer:

Python dictionaries use hash tables. The hash of the key helps locate the

corresponding entry, giving average `O(1)` lookup, insertion, and deletion.

Worst-case behavior can differ due to collisions, but interview discussions usually use average-case complexity unless specified otherwise.

---

## 15. Frequency Maps

Classic pattern:

```python
freq = {}
for x in arr:
    freq[x] = freq.get(x, 0) + 1
```

Example:

```python
arr = [1, 2, 2, 3, 3, 3]
freq = {}
for x in arr:
    freq[x] = freq.get(x, 0) + 1
```

Result:

```python
{
    1: 1,
    2: 2,
    3: 3
}
```

This is extremely important for DSA and log/event analysis.

---

## 16. `collections.Counter`

```python
from collections import Counter
c = Counter("banana")
print(c)
# Counter({'a': 3, 'n': 2, 'b': 1})
```

Important methods:

```python
c["a"]
c.get("x", 0)
c.most_common()
c.most_common(2)
c.update(["a", "b"])
c.subtract(["a"])
c.total()
```

Common use cases:

- Character frequency
- Word frequency
- Log-event frequency
- Anagram checks
- Top-K frequent elements

Example:

```python
from collections import Counter
freq = Counter(arr)
```

---

## 17. defaultdict

Useful when every missing key should have a default value.

```python
from collections import defaultdict
d = defaultdict(int)
for x in arr:
    d[x] += 1
```

Grouping:

```python
groups = defaultdict(list)
for name, department in employees:
    groups[department].append(name)
```

Normal dictionary:

```python
d = {}
if key not in d:
    d[key] = []
d[key].append(value)
```

defaultdict simplifies this pattern.

---

## 18. deque

Use deque for efficient queues.

```python
from collections import deque
q = deque()
q.append(10)
q.append(20)
q.popleft()
```

Important methods:

```python
append()
appendleft()
pop()
popleft()
extend()
extendleft()
clear()
```

Complexity:

```
append           O(1)
appendleft       O(1)
pop              O(1)
popleft          O(1)
```

Why not `list.pop(0)` ?

```python
arr.pop(0)
```

is `O(n)`, because the remaining elements have to be shifted.

---

## 19. Stack

A Python list is excellent for a stack.

```python
stack = []
stack.append(10)
stack.append(20)
top = stack[-1]
stack.pop()
```

Operations:

```
push -> append()
pop     -> pop()
peek -> stack[-1]
```

All are `O(1)` at the end.

Common applications:

- Parentheses matching
- DFS
- Undo operations
- Monotonic stack
- Expression parsing

---

## 20. Queue

Use deque .

```python
from collections import deque
queue = deque()
queue.append("task1")
queue.append("task2")
task = queue.popleft()
```

Applications:

- BFS
- Task processing
- Event processing
- Producer/consumer patterns

---

## 21. Sorting

### sorted()

Returns a new list.

```python
arr = [3, 1, 2]
result = sorted(arr)
print(arr)
# [3, 1, 2]
print(result)
# [1, 2, 3]
```

.sort()

Modifies the list.

```python
arr.sort()
```

Important:

```python
result = arr.sort()
```

result becomes None .

### Reverse sorting

```python
sorted(arr, reverse=True)
```

```python
arr.sort(reverse=True)
```

### Custom key

```python
words.sort(key=len)
```

Sort tuples by second element:

```python
arr.sort(key=lambda x: x[1])
```

Multiple keys:

```python
arr.sort(key=lambda x: (x[0], -x[1]))
```

Python's built-in sorting algorithm is Timsort and is stable.

Typical complexity:

```
O(n log n)
```

---

## 22. Important Built-in Functions

Know these very well:

```python
len()
sum()
min()
max()
abs()
round()
pow()
sorted()
reversed()
enumerate()
zip()
map()
filter()
any()
all()
range()
```

Examples:

```python
max(arr)
min(arr)
sum(arr)
```

With key:

```python
max(users, key=lambda x: x["salary"])
```

---

## 23. enumerate()

Instead of:

```python
for i in range(len(arr)):
    print(i, arr[i])
```

prefer:

```python
for i, value in enumerate(arr):
    print(i, value)
```

Start at another number:

```python
for i, value in enumerate(arr, start=1):
    print(i, value)
```

---

## 24. zip()

Combine iterables:

```python
names = ["A", "B", "C"]
scores = [90, 80, 70]
for name, score in zip(names, scores):
    print(name, score)
```

Create a dictionary:

```python
d = dict(zip(names, scores))
```

Useful for:

- Parallel iteration
- Combining arrays
- Matrix manipulation
- Mapping keys to values

---

## 25. map()

```python
nums = list(map(int, input().split()))
```

Equivalent conceptually to applying a function to every item.

```python
result = list(map(lambda x: x * 2, arr))
```

For simple transformations, list comprehensions are often more readable:

```python
result = [x * 2 for x in arr]
```

---

## 26. filter()

```python
positive = list(filter(lambda x: x > 0, arr))
```

Equivalent:

```python
positive = [x for x in arr if x > 0]
```

---

## 27. any() and all()

```python
any([False, False, True])
# True
```

```python
all([True, True, True])
# True
```

Example:

```python
if any(x < 0 for x in arr):
    print("Negative value found")
```

These can short-circuit and avoid unnecessary work.

---

## 28. Functions

Basic function:

```python
def add(a, b):
    return a + b
```

Default arguments:

```python
def greet(name="User"):
    return f"Hello {name}"
```

Keyword arguments:

```python
greet(name="Yash")
```

---

## 29. *args

Allows variable positional arguments.

```python
def total(*args):
    return sum(args)
total(1, 2, 3, 4)
```

Inside the function:

```python
args
```

is a tuple.

---

## 30. **kwargs

Allows variable keyword arguments.

```python
def show(**kwargs):
    print(kwargs)
show(name="Yash", age=26)
```

Inside the function:

```python
kwargs
```

is a dictionary.

---

## 31. Combining Function Arguments

```python
def function(a, *args, **kwargs):
    ...
```

Order matters:

```
normal parameters
*args
keyword-only parameters
**kwargs
```

Example:

```python
def f(a, b=10, *args, **kwargs):
    ...
```

---

## 32. Mutable Default Argument Trap

Avoid:

```python
def add_item(item, items=[]):
    items.append(item)
    return items
```

The same list can persist between function calls.

Use:

```python
def add_item(item, items=None):
    if items is None:
        items = []
    items.append(item)
    return items
```

This is a common Python interview question.

---

## 33. Scope — LEGB

Python resolves names using:

```
L = Local
E = Enclosing
G = Global
B = Built-in
```

Example:

```python
x = 10
def outer():
    x = 20
    def inner():
        print(x)
    inner()
```

`inner()` finds x in the enclosing scope.

---

## 34. global

```python
x = 10
def change():
    global x
    x = 20
```

Generally avoid excessive global mutable state in production code.

---

## 35. nonlocal

Used for an enclosing function variable.

```python
def counter():
    count = 0
    def increment():
        nonlocal count
        count += 1
        return count
    return increment
```

---

## 36. Lambda

Small anonymous function:

```python
square = lambda x: x * x
```

Common with:

```python
sorted()
min()
max()
map()
filter()
```

Example:

```python
max(users, key=lambda user: user["salary"])
```

Do not use complicated lambdas where a normal function is clearer.

---

## 37. Exception Handling

Basic:

```python
try:
    x = int(input())
except ValueError:
    print("Invalid number")
```

Multiple exceptions:

```python
try:
    ...
except ValueError:
    ...
except FileNotFoundError:
    ...
```

Capture exception:

```python
except Exception as e:
    print(e)
```

Full structure:

```python
try:
    ...
except SomeError:
    ...
else:
    ...
finally:
    ...
```

else runs if the try block succeeds.

finally runs regardless of success/failure.

---

## 38. Raising Exceptions

```python
raise ValueError("Invalid input")
```

Custom exception:

```python
class ServiceUnavailableError(Exception):
    pass
```

Then:

```python
raise ServiceUnavailableError("Database unavailable")
```

---

## 39. Exception Handling — Production Rules

Avoid:

```python
try:
    ...
except:
    pass
```

This can silently hide production failures.

Prefer specific exceptions:

```python
try:
    connect()
except TimeoutError:
    logger.warning("Connection timed out")
```

If an error cannot be handled locally, re-raise it:

```python
except Exception:
    logger.exception("Unexpected failure")
    raise
```

---

## 40. File Handling

Always prefer a context manager:

```python
with open("app.log", "r") as f:
    data = f.read()
```

This automatically closes the file.

### Modes

```
r     read
w     write / overwrite
a     append
x     create
b     binary
t     text
```

Examples:

```python
with open("output.txt", "w") as f:
    f.write("hello\n")
```

Append:

```python
with open("output.txt", "a") as f:
    f.write("new line\n")
```

---

## 41. Reading Large Files

Do NOT do this for a huge production log:

```python
data = open("huge.log").read()
```

It can consume a lot of memory.

Prefer:

```python
with open("huge.log") as f:
    for line in f:
        process(line)
```

This is especially important for an Application Reliability Engineer.

---

## 42. Reading File Methods

```python
f.read()
f.readline()
f.readlines()
```

For large files:

```python
for line in f:
    ...
```

is generally preferable.

---

## 43. pathlib

Modern path handling:

```python
from pathlib import Path
path = Path("logs/app.log")
```

Useful properties/methods:

```python
path.exists()
path.is_file()
path.is_dir()
path.name
path.parent
path.suffix
path.read_text()
path.write_text()
```

Find files:

```python
for file in Path("logs").glob("*.log"):
    print(file)
```

Recursive search:

```python
for file in Path(".").rglob("*.log"):
    print(file)
```

---

## 44. os

```python
import os
```

Current directory:

```python
os.getcwd()
```

List files:

```python
os.listdir(".")
```

Environment variables:

```python
os.getenv("DATABASE_URL")
```

Path checks:

```python
os.path.exists(path)
os.path.isfile(path)
os.path.isdir(path)
```

---

## 45. Environment Variables

Very important in production.

```python
import os
environment = os.getenv("ENVIRONMENT", "development")
```

Example:

```python
db_url = os.getenv("DATABASE_URL")
if not db_url:
    raise RuntimeError("DATABASE_URL is missing")
```

Never hard-code secrets:

```python
PASSWORD = "actual-password"            # BAD
```

---

## 46. JSON

Import:

```python
import json
```

Python object → JSON string:

```python
text = json.dumps(data)
```

JSON string → Python object:

```python
data = json.loads(text)
```

File → Python:

```python
with open("config.json") as f:
    config = json.load(f)
```

Python → file:

```python
with open("config.json", "w") as f:
    json.dump(config, f, indent=2)
```

Common reliability uses:

- Configuration
- API responses
- Structured logs
- Service metadata
- Monitoring payloads

---

## 47. Regular Expressions

```python
import re
```

Important functions:

```python
re.search()
re.match()
re.fullmatch()
re.findall()
re.finditer()
re.sub()
re.split()
```

Example:

```python
matches = re.findall(r"ERROR.*", log)
```

Compile a frequently reused pattern:

```python
pattern = re.compile(r"ERROR|CRITICAL")
if pattern.search(line):
    ...
```

---

## 48. Important Regex Symbols

```
.           any character
\d          digit
\w          word character
\s          whitespace
^           start of string
$           end of string
*           zero or more
+           one or more
?           zero or one
{m,n}       between m and n
[]          character class
()          group
|           OR
```

Example:

```python
r"\d+"
```

matches one or more digits.

---

## 49. Log Parsing

Example:

```
2026-09-28 18:32:41 ERROR payment timeout request_id=abc123
```

Simple parsing:

```python
parts = line.split()
timestamp = " ".join(parts[:2])
level = parts[2]
message = " ".join(parts[3:])
```

Regex:

```python
pattern = re.compile(
    r"(?P<timestamp>\S+\s+\S+)\s+"
    r"(?P<level>\w+)\s+"
    r"(?P<message>.*)"
)
match = pattern.match(line)
if match:
    data = match.groupdict()
```

---

## 50. Logging

Production applications should use logging rather than relying on `print()` .

```python
import logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)
```

Levels:

```python
logger.debug("debug")
logger.info("service started")
logger.warning("high latency")
logger.error("request failed")
logger.critical("service unavailable")
```

Inside an exception handler:

```python
logger.exception("Unexpected failure")
```

`logger.exception()` includes traceback information.

---

## 51. subprocess

Extremely relevant for reliability scripting.

Run a Linux command:

```python
import subprocess
result = subprocess.run(
    ["ls", "-l"],
    capture_output=True,
    text=True
)
print(result.stdout)
print(result.stderr)
print(result.returncode)
```

Recommended:

```python
result = subprocess.run(
    ["ls", "-l"],
    capture_output=True,
    text=True,
    check=True
)
```

check=True raises an exception if the command returns a non-zero exit code.

---

## 52. Subprocess Timeout

```python
subprocess.run(
    ["some_command"],
    timeout=10
)
```

This prevents waiting indefinitely.

Production scripts should consider:

- Timeout
- Exit code
- stdout
- stderr
- retries
- cleanup

---

## 53. shell=True

Avoid blindly doing:

```python
subprocess.run(command, shell=True)
```

especially when command contains untrusted input.

Prefer:

```python
subprocess.run(
    ["grep", "ERROR", "app.log"]
)
```

Passing arguments separately is safer and clearer.

---

## 54. sys

Useful for command-line scripts:

```python
import sys
print(sys.argv)
```

Example:

```bash
python script.py file.log
```

Then:

```python
sys.argv[0]
sys.argv[1]
```

For more structured command-line interfaces, prefer argparse .

---

## 55. argparse

```python
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("--file", required=True)
parser.add_argument("--verbose", action="store_true")
args = parser.parse_args()
print(args.file)
print(args.verbose)
```

This is useful for operational scripts.

---

## 56. Time and Datetime

```python
import time
time.time()
time.sleep(1)
```

`time.time()` gives Unix epoch time.

Datetime:

```python
from datetime import datetime, timezone
now = datetime.now(timezone.utc)
```

ISO timestamp:

```python
timestamp = datetime.now(timezone.utc).isoformat()
```

Production considerations:

- UTC vs local time
- Timezone-aware vs naive datetime
- Daylight-saving changes
- Timestamp precision

---

## 57. Iterables and Iterators

An iterable can be iterated over:

```python
list
tuple
str
dict
set
```

Iterator:

```python
it = iter([1, 2, 3])
next(it)
next(it)
```

Eventually:

```python
StopIteration
```

---

## 58. Generators

Generators produce values lazily.

```python
def numbers():
    for i in range(5):
        yield i
```

Usage:

```python
for x in numbers():
    print(x)
```

Why generators matter:

A list:

```python
values = [x for x in range(10_000_000)]
```

stores all values.

Generator:

```python
values = (x for x in range(10_000_000))
```

produces values lazily.

This is particularly useful for:

- Large logs
- Streams
- Large datasets
- Memory-efficient pipelines

---

## 59. Generator Expressions

```python
total = sum(x * x for x in range(1_000_000))
```

This avoids constructing a million-element list.

---

## 60. Decorators

A decorator wraps/modifies a function.

```python
def decorator(func):
    def wrapper(*args, **kwargs):
        print("before")
        result = func(*args, **kwargs)
        print("after")
        return result
    return wrapper
```

Usage:

```python
@decorator
def hello():
    print("hello")
```

Common real-world uses:

- Logging
- Timing
- Authentication
- Authorization
- Retry wrappers
- Caching
- Validation

---

## 61. functools.wraps

When writing decorators:

```python
from functools import wraps
def decorator(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        return func(*args, **kwargs)
    return wrapper
```

wraps preserves metadata such as the original function name and docstring.

---

## 62. OOP

Basic class:

```python
class Book:
    def __init__(self, title, author):
        self.title = title
        self.author = author
    def describe(self):
        return f"{self.title} by {self.author}"
```

Object:

```python
book = Book("Python", "Author")
```

---

## 63. self

self refers to the current instance.

```python
class User:
    def __init__(self, name):
        self.name = name
    def greet(self):
        return self.name
```

---

## 64. Instance vs Class Variables

Instance variable:

```python
class Employee:
    def __init__(self, name):
        self.name = name
```

Class variable:

```python
class Employee:
    company = "ABC"
```

Class variables are shared at the class level.

---

## 65. Inheritance

```python
class Animal:
    def speak(self):
        print("sound")
class Dog(Animal):
    def speak(self):
        print("bark")
```

Dog inherits from Animal .

---

## 66. super()

```python
class Animal:
    def __init__(self, name):
        self.name = name
class Dog(Animal):
    def __init__(self, name, breed):
        super().__init__(name)
        self.breed = breed
```

`super()` allows access to the parent implementation.

---

## 67. Method Overriding

```python
class Parent:
    def show(self):
        print("parent")
class Child(Parent):
    def show(self):
        print("child")
```

The child overrides the parent's method.

---

## 68. Dataclasses

Useful for data-oriented classes:

```python
from dataclasses import dataclass
@dataclass
class User:
    name: str
    age: int
```

This automatically provides useful methods such as an initializer and representation.

---

## 69. Type Hints

```python
def add(a: int, b: int) -> int:
    return a + b
```

Collections:

```python
def total(values: list[int]) -> int:
    return sum(values)
```

Type hints improve readability and tooling but normally do not enforce types at runtime.

---

## 70. Mutable vs Immutable

### Mutable

```
list
dict
set
bytearray
```

### Immutable

```
int
float
bool
str
tuple
frozenset
bytes
```

Example:

```python
a = [1, 2]
b = a
b.append(3)
print(a)
# [1, 2, 3]
```

Both variables refer to the same list.

---

## 71. == vs is

```python
a == b
```

checks equality.

```python
a is b
```

checks whether they are the same object.

Example:

```python
a = [1, 2]
b = [1, 2]
a == b
# True
a is b
# False
```

---

## 72. Shallow vs Deep Copy

```python
import copy
shallow = copy.copy(obj)
deep = copy.deepcopy(obj)
```

Shallow copy copies the outer object but nested mutable objects can still be shared. Deep copy recursively copies nested objects.

---

## 73. Common List Aliasing Trap

Bad:

```python
matrix = [[0] * 3] * 3
```

All rows reference the same inner list.

Better:

```python
matrix = [[0] * 3 for _ in range(3)]
```

---

## 74. GIL

The Global Interpreter Lock (GIL) is a major CPython interview topic.

In traditional CPython execution, the GIL allows only one thread at a time to execute Python bytecode within a process.

Important distinction:

### CPU-bound

Examples:

- Heavy computation
- Large pure-Python calculations

Traditional approach:

```
multiprocessing
```

or native/optimized libraries where appropriate.

### I/O-bound

Examples:

- Network requests
- File I/O
- Database calls

Threads can still be useful because the program spends time waiting for I/O.

Also know:

```
threading
multiprocessing
asyncio
```

---

## 75. Threading vs Multiprocessing vs Asyncio

| Approach | Good for | Key idea |
|---|---|---|
| Threading | I/O-bound work | Multiple threads |
| Multiprocessing | CPU-bound work | Multiple processes |
| Asyncio | Many I/O tasks | Cooperative async execution |

Do not reduce the decision to "threads are bad because of GIL."

The GIL mainly affects simultaneous execution of Python bytecode in traditional CPython; I/O-bound threads can still be useful.

---

## 76. Monkey Patching

Monkey patching means changing/replacing behavior at runtime.

```python
class Service:
    def call(self):
        return "real"
def fake_call(self):
    return "fake"
Service.call = fake_call
```

Now:

```python
Service().call()
# fake
```

Uses:

- Testing
- Temporary behavior replacement
- Dynamic modification

Risks:

- Hidden behavior
- Harder debugging
- Unexpected side effects
- Maintenance problems

---

## 77. Python Modules

Import:

```python
import math
```

Specific import:

```python
from math import sqrt
```

Alias:

```python
import datetime as dt
```

Module structure:

```
project/
    main.py
    utils.py
```

```python
from utils import helper
```

---

## 78. __name__ == "__main__"

```python
def main():
    print("running")
if __name__ == "__main__":
    main()
```

This allows the file to be imported without automatically executing the main program.

---

## 79. Standard Library Modules to Know

For this role, know the purpose of:

```
os
sys
pathlib
subprocess
json
re
time
datetime
logging
argparse
collections
itertools
functools
heapq
bisect
math
statistics
```

You do not need to memorize every function.

Know common functions and when to use each module.

---

## 80. Big-O Complexity

Big-O describes how resource requirements grow with input size.

Examples:

```
O(1)
O(log n)
O(n)
O(n log n)
O(n²)
O(2ⁿ)
```

Common examples:

```
Hash lookup                     O(1) average
Linear scan                     O(n)
Binary search                   O(log n)
Sorting                         O(n log n)
Nested loop                     O(n²)
```

---

## 81. Complexity Table

| Operation | Typical Complexity |
|---|---|
| List index | O(1) |
| List append | O(1) amortized |
| List pop end | O(1) |
| List insert beginning | O(n) |
| List pop beginning | O(n) |
| List search | O(n) |
| Dict lookup | O(1) average |
| Dict insert | O(1) average |
| Set lookup | O(1) average |
| Stack push | O(1) |
| Stack pop | O(1) |
| Queue append | O(1) |
| Queue popleft | O(1) |
| Binary search | O(log n) |
| Sorting | O(n log n) |
| BFS/DFS | O(V + E) |

---

## 82. Two Pointers

Common for sorted arrays and strings.

```python
left = 0
right = len(arr) - 1
while left < right:
    ...
```

Example: pair sum in sorted array.

```python
def two_sum_sorted(arr, target):
    left = 0
    right = len(arr) - 1
    while left < right:
        total = arr[left] + arr[right]
        if total == target:
            return left, right
        if total < target:
            left += 1
        else:
            right -= 1
    return None
```

Complexity:

```
O(n) time
O(1) extra space
```

---

## 83. Sliding Window

Useful for contiguous subarrays/substrings.

General pattern:

```python
left = 0
for right in range(len(arr)):
    # add arr[right]
    while window_is_invalid:
        # remove arr[left]
        left += 1
    # process window
```

Common problems:

- Longest substring without repeating characters
- Maximum sum subarray of fixed size
- Minimum window
- Longest subarray satisfying a condition

---

## 84. Prefix Sum

Useful for repeated range-sum queries.

```python
prefix = [0]
for x in arr:
    prefix.append(prefix[-1] + x)
```

Range sum [l, r] :

```python
prefix[r + 1] - prefix[l]
```

Preprocessing:

```
O(n)
```

Each range query:

```
O(1)
```

---

## 85. Hash Map — Two Sum

Classic problem:

```python
def two_sum(arr, target):
    seen = {}
    for i, x in enumerate(arr):
        need = target - x
        if need in seen:
            return [seen[need], i]
        seen[x] = i
    return []
```

Complexity:

```
Time:    O(n)
Space: O(n)
```

The important reasoning is trading `O(n)` extra memory for a reduction from `O(n²)` to `O(n)` time.

---

## 86. String Algorithms

Know how to solve:

- Reverse string
- Palindrome
- Character frequency
- Anagram
- First non-repeating character
- Longest substring without repeating characters
- Longest common prefix
- String compression
- Log parsing

Palindrome:

```python
def is_palindrome(s):
    return s == s[::-1]
```

Anagram:

```python
from collections import Counter
def is_anagram(a, b):
    return Counter(a) == Counter(b)
```

---

## 87. Binary Search

Use when the search space is ordered or has a monotonic property.

```python
def binary_search(arr, target):
    left = 0
    right = len(arr) - 1
    while left <= right:
        mid = left + (right - left) // 2
        if arr[mid] == target:
            return mid
        if arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1
```

Complexity:

```
Time: O(log n)
Space: O(1)
```

---

## 88. Production Log Binary Search

This is particularly relevant to the supplied interview experience.

Suppose:

```
10:00 healthy
10:05 healthy
10:10 healthy
10:15 failing
10:20 failing
10:25 failing
```

Question:

What is the earliest timestamp at which failure started?

Do not necessarily scan every timestamp.

If health status is monotonic:

```
healthy healthy healthy | failing failing failing
```

binary search can find the transition.

General approach:

```python
left = first_timestamp
right = last_timestamp
while left < right:
    mid = ...
    if is_failing(mid):
        right = mid
    else:
        left = mid + 1
return left
```

The key interview point is not just coding binary search. Explain the assumption:

The predicate must be monotonic: once the service is considered failing, all later checked points must also satisfy the failure condition.

---

## 89. Stack — Valid Parentheses

```python
def valid_parentheses(s):
    stack = []
    pairs = {
        ")": "(",
        "]": "[",
        "}": "{"
    }
    for ch in s:
        if ch in "([{":
            stack.append(ch)
        else:
            if not stack:
                return False
            if stack.pop() != pairs[ch]:
                return False
    return not stack
```

Complexity:

```
Time: O(n)
Space: O(n)
```

---

## 90. Heap / Priority Queue

Python provides heapq .

```python
import heapq
```

Create:

```python
heap = []
```

Push:

```python
heapq.heappush(heap, 5)
heapq.heappush(heap, 2)
```

Pop minimum:

```python
heapq.heappop(heap)
```

Convert list into heap:

```python
heapq.heapify(arr)
```

Other functions:

```python
heapq.heappushpop()
heapq.heapreplace()
heapq.nsmallest()
heapq.nlargest()
```

Python's heapq is a min-heap by default.

Uses:

- Top K
- Priority queues
- Scheduling
- Merge sorted sequences
- Shortest-path algorithms

---

## 91. bisect

Useful for sorted lists.

```python
import bisect
```

Functions:

```python
bisect.bisect_left(arr, x)
bisect.bisect_right(arr, x)
bisect.insort(arr, x)
```

Important distinction:

Binary search can be O(log n), but insertion into a Python list can still be `O(n)` because elements may have to move.

---

## 92. Recursion

Example:

```python
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)
```

Every recursive solution needs:

1. Base case
2. Progress toward base case
3. Recursive call

Know that recursion consumes call-stack space and Python has a recursion-depth limit.

---

## 93. Graph Representation

Adjacency list:

```python
graph = {
    "A": ["B", "C"],
    "B": ["A", "D"],
    "C": ["A"],
    "D": ["B"]
}
```

---

## 94. BFS

```python
from collections import deque
def bfs(graph, start):
    queue = deque([start])
    visited = {start}
    while queue:
        node = queue.popleft()
        for neighbor in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)
```

Complexity:

```
O(V + E)
```

Uses:

- Shortest path in unweighted graph
- Level traversal
- Connectivity

---

## 95. DFS

Recursive:

```python
def dfs(graph, node, visited):
    if node in visited:
        return
    visited.add(node)
    for neighbor in graph[node]:
        dfs(graph, neighbor, visited)
```

Complexity:

```
O(V + E)
```

---

## 96. Dynamic Programming

Recognize:

- Overlapping subproblems
- Optimal substructure

Common problems:

```
Fibonacci
Climbing stairs
Coin change
0/1 knapsack
Longest common subsequence
```

---

## 97. Fractional Knapsack

The supplied older material includes fractional knapsack.

For fractional knapsack:

```
value / weight
```

Calculate the value-to-weight ratio.

Take items in descending ratio order.

Greedy works because fractions are allowed.

Important distinction:

```
Fractional knapsack -> Greedy
0/1 knapsack               -> Usually DP
```

---

## 98. Common Python Interview Traps

### sort() vs sorted()

```python
arr.sort()
```

changes arr .

```python
sorted(arr)
```

returns a new sorted list.

### remove() vs pop()

```python
arr.remove(value)
```

removes by value.

```python
arr.pop(index)
```

removes by index and returns the value.

### discard() vs remove()

For sets:

```python
s.remove(x)
```

can raise an exception.

```python
s.discard(x)
```

does not if absent.

### dict.get()

```python
d.get("x", 0)
```

returns the default without inserting "x" .

### in on a dictionary

```python
"x" in d
```

checks keys.

Not values.

---

## 99. Useful Python Patterns

Swap:

```python
a, b = b, a
```

Reverse:

```python
arr[::-1]
```

Reverse in-place:

```python
arr.reverse()
```

Unique while preserving insertion order:

```python
unique = list(dict.fromkeys(arr))
```

Flatten:

```python
flat = [x for row in matrix for x in row]
```

Transpose:

```python
transposed = list(zip(*matrix))
```

Adjacent pairs:

```python
for a, b in zip(arr, arr[1:]):
    ...
```

---

## 100. Reading Large Logs

A practical reliability script:

```python
from collections import Counter
errors = Counter()
with open("app.log") as f:
    for line in f:
        if "ERROR" in line:
            errors["ERROR"] += 1
print(errors)
```

More useful:

```python
errors = Counter()
with open("app.log") as f:
    for line in f:
        if "ERROR" in line:
            parts = line.split()
            if len(parts) >= 3:
                error_type = parts[2]
                errors[error_type] += 1
```

The important concept:

Process the file as a stream instead of loading the entire file into memory.

---

## 101. Finding the Latest Error

```python
latest_error = None
with open("app.log") as f:
    for line in f:
        if "ERROR" in line:
            latest_error = line.strip()
print(latest_error)
```

---

## 102. Finding Error Lines with Regex

```python
import re
pattern = re.compile(r"\b(ERROR|CRITICAL)\b")
with open("app.log") as f:
    for line in f:
        if pattern.search(line):
            print(line.strip())
```

---

## 103. Retry Logic

Basic retry:

```python
import time
for attempt in range(3):
    try:
        result = call_service()
        break
    except TimeoutError:
        if attempt == 2:
            raise
        time.sleep(2 ** attempt)
```

Concepts to understand:

- Maximum attempts
- Timeout
- Exponential backoff
- Jitter
- Which errors are retryable
- Avoiding retry storms

---

## 104. Exponential Backoff

Instead of retrying immediately:

```
1 second
2 seconds
4 seconds
8 seconds
...
```

Example:

```python
delay = 2 ** attempt
```

Production systems often add jitter so many clients do not retry simultaneously.

---

## 105. Timeout vs Retry

Timeout:

How long should I wait?

Retry:

Should I attempt the operation again?

They solve different problems.

Bad reliability pattern:

```
no timeout
+
infinite retries
```

This can cause stuck requests and retry storms.

---

## 106. Idempotency

An operation is idempotent when repeating it produces the same intended final state. Example concept:

```
Set server configuration X = 10
```

Doing it twice still leaves X at 10.

Non-idempotent example:

```
Charge customer ₹100
```

Repeating it could charge twice.

In distributed/reliable systems, idempotency keys can prevent duplicate operations.

---

## 107. Concurrency

Know the difference:

```
Concurrency != Parallelism
```

Concurrency:

Multiple tasks make progress during overlapping periods.

Parallelism:

Multiple tasks execute simultaneously.

Python tools:

```
threading
multiprocessing
asyncio
```

---

## 108. asyncio Basics

```python
import asyncio
async def main():
    await asyncio.sleep(1)
    print("done")
asyncio.run(main())
```

async def creates a coroutine function.

await allows other asynchronous work to proceed while waiting for an awaitable. For this interview, understand the concept rather than spending excessive preparation time on advanced asyncio internals.

---

## 109. Testing

Know:

```
pytest
unittest
unittest.mock
```

Basic pytest:

```python
def test_add():
    assert add(2, 3) == 5
```

Mock:

```python
from unittest.mock import Mock
service = Mock()
service.call.return_value = "ok"
assert service.call() == "ok"
```

For reliability code, test:

- Successful path
- Failure path
- Timeout
- Retry
- Invalid input
- Missing configuration
- External service failure

---

## 110. Production-Quality Python

Good production code generally has:

- Meaningful names
- Small functions
- Clear exception handling
- Logging
- Tests
- Sensible type hints
- No unnecessary global state
- Configuration separated from code
- Explicit timeouts
- Controlled retries
- Predictable exit codes
- Safe subprocess usage

---

## 111. Debugging a Python Production Issue

A strong interview approach:

```
1. Understand the symptom
2. Establish scope
3. Check logs
4. Check recent changes
5. Reproduce if possible
6. Identify the failing component
7. Form a hypothesis
8. Test the hypothesis
9. Mitigate impact
10. Find root cause
11. Implement permanent fix
12. Add monitoring/test/runbook to prevent recurrence
```

Do not immediately jump into changing code.

---

## 112. Production Scenario — Service Is Down

Interview answer structure:

```
1. Confirm whether the alert is real.
2. Determine scope: one instance, service, host, region, or dependency.
3. Check application logs.
4. Check infrastructure metrics.
5. Check recent deployments/config changes.
6. Check dependencies such as DB/cache/message queue.
7. Apply safe mitigation if needed.
8. Escalate to the correct owner.
9. Preserve evidence.
10. Perform root-cause analysis.
11. Implement and verify permanent fix.
12. Update monitoring/runbook if necessary.
```

This aligns closely with the Application Reliability Engineer responsibilities in the JD.

---

## 113. Production Scenario — CPU Is 100%

Possible investigation:

```
1. Confirm which process is consuming CPU.
2. Determine whether usage is sustained.
3. Check recent deployment/change.
4. Check application logs.
5. Determine whether traffic increased.
6. Check for infinite loops or runaway jobs.
7. Check external dependencies.
8. Mitigate if required.
9. Capture evidence.
10. Fix root cause.
```

Linux tools you should know:

```
top
htop
ps
pidstat
vmstat
iostat
sar
```

---

## 114. Production Scenario — Memory Is Increasing

Possible causes:

- Memory leak
- Unbounded cache
- Growing queue
- Large objects retained
- Unexpected traffic
- Log buffering
- Resource not released

Python-specific tools/concepts:

```
gc
tracemalloc
memory_profiler
```

Basic tracemalloc :

```python
import tracemalloc
tracemalloc.start()
# application code
snapshot = tracemalloc.take_snapshot()
```

---

## 115. Production Scenario — API Is Slow

Check:

```
Application latency
Database latency
External API latency
CPU
Memory
Network
Connection pool
Cache
Recent deployment
Traffic volume
Error rate
```

Break latency down instead of assuming the application itself is slow.

---

## 116. Production Scenario — Error Rate Suddenly

### Increases

Use:

```
timestamp
deployment history
logs
metrics
traces
traffic
dependency health
database health
```

Compare:

```
before incident
during incident
after mitigation
```

The goal is to distinguish:

```
symptom
from
root cause
```

---

## 117. Structured Problem Solving

When asked:

How would you solve this?

Use:

```
Clarify
↓
Identify constraints
↓
Choose data structure
↓
Design algorithm
↓
Explain complexity
↓
Implement
↓
Test edge cases
↓
Discuss alternatives
```

This is especially important because the supplied interview experience mentions interviewers expecting alternative approaches and trade-offs.

---

## 118. Alternative Solutions and Trade-offs

Example:

Find duplicates in an array.

### Approach 1 — Nested loops

```python
for i in range(n):
    for j in range(i + 1, n):
        ...
```

Complexity:

```
O(n²)
```

Space:

```
O(1)
```

### Approach 2 — Set

```python
seen = set()
for x in arr:
    if x in seen:
        ...
    seen.add(x)
```

Complexity:

```
O(n) average
```

Space:

```
O(n)
```

Interview point:

The set approach trades additional memory for much better average runtime.

---

## 119. Python Data Structure Master Table

| Structure | Ordered | Mutable | Duplicates | Typical Strength |
|---|---|---|---|---|
| list | Yes | Yes | Yes | General sequence |
| tuple | Yes | No | Yes | Immutable sequence |
| set | No ordering guarantee to rely on | Yes | No | Membership |
| frozenset | No | No | No | Immutable set |
| dict | Insertion ordered | Yes | Keys unique | Key-value lookup |
| deque | Yes | Yes | Yes | Efficient operations at both ends |
| str | Yes | No | Yes | Text |
| heapq | Heap ordering | Yes | Yes | Priority queue |

---

## 120. Major Methods — Master Cheat Sheet

### List

```python
append
extend
insert
remove
pop
clear
index
count
sort
reverse
copy
```

### Dictionary

```python
get
keys
values
items
update
pop
popitem
setdefault
clear
copy
```

### Set

```python
add
update
remove
discard
pop
clear
union
intersection
difference
symmetric_difference
issubset
issuperset
```

### String

```python
lower
upper
capitalize
title
strip
lstrip
rstrip
split
join
replace
find
rfind
index
count
startswith
endswith
isalpha
isdigit
isalnum
isspace
```

### Deque

```python
append
appendleft
pop
popleft
extend
extendleft
clear
```

### Counter

```python
get
most_common
update
subtract
total
```

### Heapq

```python
heappush
heappop
heapify
heappushpop
heapreplace
nsmallest
nlargest
```

---

## 121. Python Reliability Script Example

A simple script that checks a log and returns a useful exit code:

```python
#!/usr/bin/env python3
import sys
from pathlib import Path
LOG_FILE = Path("app.log")
if not LOG_FILE.exists():
    print(f"Missing log file: {LOG_FILE}", file=sys.stderr)
    sys.exit(2)
errors = 0
with LOG_FILE.open() as f:
    for line in f:
        if "ERROR" in line or "CRITICAL" in line:
            errors += 1
print(f"Errors found: {errors}")
if errors:
    sys.exit(1)
sys.exit(0)
```

Important concepts:

- File existence check
- Streaming file processing
- stderr
- Exit codes
- Automation-friendly behavior

---

## 122. Python + Linux Integration Example

```python
import subprocess
result = subprocess.run(
    ["systemctl", "is-active", "myservice"],
    capture_output=True,
    text=True
)
status = result.stdout.strip()
if status != "active":
    print(f"Service unhealthy: {status}")
```

A production version should additionally consider:

- Timeout
- Non-zero exit code
- Permission failure
- Logging
- Alerting
- Retries where appropriate

---

## 123. Interview Questions — Python Fundamentals

Be ready to answer:

1. What does dynamically typed mean?
2. What is the difference between `==` and is ?
3. Which Python types are mutable?
4. List vs tuple?
5. List vs set?
6. Dictionary vs set?
7. Why is dictionary lookup usually `O(1)`?
8. Why is `list.pop(0)` `O(n)`?
9. Why use deque ?
10. What is a generator?
11. What is an iterator?
12. What is a decorator?
13. What is monkey patching?
14. Explain LEGB.
15. What are `*args` and `**kwargs` ?
16. What is the mutable default argument problem?
17. Explain shallow vs deep copy.
18. What is the GIL?
19. Threading vs multiprocessing?
20. What is `__name__ `==` "__main__"` ?
21. What is `super()` ?
22. How does exception handling work?
23. Why use context managers for files?
24. How do generators help with large files?
25. What is the difference between `sort()` and `sorted()` ?
---

## 124. Interview Questions — DSA

Be ready to code and explain:

1. Reverse a string.
2. Check palindrome.
3. Count character frequencies.
4. Find first non-repeating character.
5. Check anagrams.
6. Two Sum.
7. Remove duplicates.
8. Find duplicates.
9. Find maximum/minimum.
10. Merge sorted arrays.
11. Binary search.
12. Find first occurrence.
13. Find first failing timestamp.
14. Sliding-window maximum/minimum.
15. Longest substring without repeating characters.
16. Valid parentheses.
17. Implement stack.
18. Implement queue.
19. BFS.
20. DFS.
21. Top-K elements.
22. Basic heap problems.
23. Prefix sum.
24. Basic dynamic programming.
25. Explain time and space complexity.
---

## 125. Interview Questions — Production Python

Be ready to answer:

1. How would you process a 50 GB log file?
2. How would you find all ERROR lines?
3. How would you count errors by type?
4. How would you find the first timestamp when errors began?
5. How would you execute a Linux command from Python?
6. How would you handle command failure?
7. How would you prevent a subprocess from hanging forever?
8. How would you implement retries?
9. When should you NOT retry?
10. Why use exponential backoff?
11. What is idempotency?
12. How would you debug a memory leak?
13. How would you debug high CPU?
14. How would you debug high latency?
15. How would you make a monitoring script reliable?
16. How would you handle missing configuration?
17. How would you log exceptions?
18. How would you test failure scenarios?
19. How would you safely handle secrets?
20. How would you build an operational runbook from recurring incidents?
---

## 126. Four-Day Python Preparation Priority

### Day 1 — Core Python

Master:

```
strings
lists
dicts
sets
tuples
functions
exceptions
comprehensions
sort/sorted
enumerate
zip
Counter
defaultdict
deque
```

Practice writing these without looking up syntax.

### Day 2 — Python Internals + DSA

Master:

```
mutability
== vs is
copy
LEGB
*args / **kwargs
generators
decorators
OOP
inheritance
super
GIL
monkey patching
Big-O
hash maps
two pointers
sliding window
binary search
stack
queue
heap
```

### Day 3 — Reliability Python

Master:

```
open()
pathlib
os
sys
subprocess
regex
json
logging
argparse
datetime
environment variables
large-file processing
log parsing
timeouts
retry
backoff
exit codes
```

### Day 4 — Interview Simulation

Do problems under time pressure.

For every coding problem say:

```
1. Brute force
2. Better approach
3. Data structure choice
4. Algorithm
5. Time complexity
6. Space complexity
7. Edge cases
8. Test cases
9. Alternative/trade-off
```

Then practice production scenarios:

```
service down
CPU high
memory high
latency high
error rate high
database unavailable
deployment caused failures
log volume suddenly increased
```

---

## 127. Final Revision Sheet

```
PYTHON
--------------------------------
Mutable:
list, dict, set
Immutable:
int, float, bool, str, tuple, frozenset
==    -> equality
is    -> identity
LEGB:
Local -> Enclosing -> Global -> Built-in
LIST
--------------------------------
append
extend
insert
remove
pop
clear
index
count
sort
reverse
copy
DICT
--------------------------------
get
keys
values
items
update
pop
popitem
setdefault
SET
--------------------------------
add
update
remove
discard
union
intersection
difference
symmetric_difference
STRING
--------------------------------
split
join
strip
replace
find
index
count
startswith
endswith
lower
upper
COLLECTIONS
--------------------------------
Counter
defaultdict
deque
STACK
--------------------------------
append
pop
[-1]
QUEUE
--------------------------------
deque.append
deque.popleft
HEAP
--------------------------------
heappush
heappop
heapify
CORE
--------------------------------
len
sum
min
max
sorted
enumerate
zip
map
filter
any
all
PYTHON INTERNALS
--------------------------------
GIL
monkey patching
iterators
generators
decorators
LEGB
shallow/deep copy
OOP
inheritance
super
RELIABILITY
--------------------------------
open()
pathlib
os
sys
subprocess
regex
json
logging
argparse
datetime
environment variables
PRODUCTION
--------------------------------
logs
timeouts
retries
backoff
idempotency
exit codes
exception handling
monitoring
debugging
DSA
--------------------------------
Big-O
hash map
two pointers
sliding window
prefix sum
binary search
stack
queue
heap
BFS
DFS
basic DP
```

---

## 128. Most Important Mental Model

For this particular interview, do not think:

"I need to memorize Python syntax."

Think:

```
Problem
    ↓
What is happening?
    ↓
What data do I need?
    ↓
Which data structure fits?
    ↓
What is the simplest correct solution?
    ↓
Can I optimize it?
    ↓
Time complexity?
    ↓
Space complexity?
    ↓
What can fail in production?
    ↓
How would I observe/debug/recover it?
```

That combination of Python + DSA + Linux-oriented scripting + production debugging is the most relevant preparation pattern for the Application Reliability Engineer role.