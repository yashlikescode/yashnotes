# REACT INTERVIEW QUESTIONS & ANSWERS

## 1. What is React?
**Ideal Answer**
React is an open-source JavaScript library developed by Facebook for building user interfaces, primarily for Single Page Applications (SPAs). It uses a **component-based architecture** and a **Virtual DOM** for efficient rendering. React focuses only on the UI layer and can be combined with other libraries for routing, state management, etc.

## 2. Virtual DOM vs Real DOM
**Ideal Answer**
| Feature | Real DOM | Virtual DOM |
|---|---|---|
| Speed | Slow to update | Fast |
| Updates | Entire DOM re-rendered | Only changed nodes updated |
| Memory | Higher | Lightweight copy |

**How Virtual DOM works:**
1. State changes → React creates new Virtual DOM
2. Diffing algorithm compares new vs old Virtual DOM (Reconciliation)
3. Only actual differences are applied to Real DOM (Patch)

## 3. React Component Types (Functional vs Class)
**Ideal Answer**
Class components use ES6 classes and lifecycle methods. Functional components are plain functions that use Hooks. Modern React prefers functional components.

```jsx
// 1. Functional Components (modern, preferred)
const UserCard = ({ name, age }) => {
    return (
        <div className="card">
            <h2>{name}</h2>
            <p>Age: {age}</p>
        </div>
    );
};

// 2. Class Components (older pattern)
class UserCard extends React.Component {
    render() {
        const { name, age } = this.props;
        return (
            <div className="card">
                <h2>{name}</h2>
                <p>Age: {age}</p>
            </div>
        );
    }
}
```

## 4. What is JSX?
**Answer:** JSX is a syntax extension that lets you write HTML-like code inside JavaScript. It gets compiled to `React.createElement()` calls.

## 5. Props vs State
**Ideal Answer**
| Feature | Props | State |
|---|---|---|
| Source | Passed from parent | Local to component |
| Mutable | No (read-only) | Yes (via setState/useState) |
| Triggers re-render | Yes | Yes |
| Ownership | Parent owns | Component owns |

```jsx
// Props - parent to child, read-only
const Button = ({ label, onClick, disabled }) => (
    <button onClick={onClick} disabled={disabled}>
        {label}
    </button>
);

// State - internal to component
const LoginForm = () => {
    const [username, setUsername] = useState('');
    const [password, setPassword] = useState('');
    const [loading, setLoading] = useState(false);

    const handleSubmit = async (e) => {
        e.preventDefault();
        setLoading(true);
        await login(username, password);
        setLoading(false);
    };

    return (
        <form onSubmit={handleSubmit}>
            <input value={username} onChange={e => setUsername(e.target.value)} />
            <input type="password" value={password} onChange={e => setPassword(e.target.value)} />
            <Button label={loading ? 'Loading...' : 'Login'} disabled={loading} onClick={() => {}} />
        </form>
    );
};
```

## 6. React Hooks
**Ideal Answer**
Hooks let functional components use state and lifecycle features.

```jsx
import React, { useState, useEffect, useCallback, useMemo, useRef, useContext } from 'react';

// 1. useState - local state
const Counter = () => {
    const [count, setCount] = useState(0);
    return (
        <div>
            <p>Count: {count}</p>
            <button onClick={() => setCount(prev => prev + 1)}>Increment</button>
            <button onClick={() => setCount(prev => prev - 1)}>Decrement</button>
        </div>
    );
};

// 2. useEffect - side effects
const UserProfile = ({ userId }) => {
    const [user, setUser] = useState(null);
    const [loading, setLoading] = useState(true);

    // Runs once on mount
    useEffect(() => {
        console.log('Component mounted');
        return () => console.log('Component unmounted'); // cleanup
    }, []);

    // Runs when userId changes
    useEffect(() => {
        setLoading(true);
        fetch(`/api/users/${userId}`)
            .then(res => res.json())
            .then(data => {
                setUser(data);
                setLoading(false);
            });
    }, [userId]); // dependency array

    if (loading) return <div>Loading...</div>;
    return <div>{user?.name}</div>;
};
```

## 7. useCallback and useMemo
**Ideal Answer**
`useMemo` memoizes a computed value. `useCallback` memoizes a function. Both prevent unnecessary recalculations/re-renders.

```jsx
// useMemo - memoizes a computed value
const ExpensiveComponent = ({ numbers }) => {
    // Recalculates only when 'numbers' changes
    const sum = useMemo(() => {
        console.log('Calculating sum...');
        return numbers.reduce((acc, n) => acc + n, 0);
    }, [numbers]);

    return <div>Sum: {sum}</div>;
};

// useCallback - memoizes a function reference
const ParentComponent = () => {
    const [count, setCount] = useState(0);
    const [text, setText] = useState('');

    // Recreate only when count changes
    const handleClick = useCallback(() => {
        console.log('Clicked, count:', count);
    }, [count]); 

    return (
        <div>
            <input value={text} onChange={e => setText(e.target.value)} />
            <ChildComponent onClick={handleClick} />
        </div>
    );
};
```

## 8. useRef
**Ideal Answer**
`useRef` holds a mutable value that persists across renders and can directly reference DOM elements without triggering re-renders.

```jsx
const FormComponent = () => {
    // 1. DOM reference
    const inputRef = useRef(null);

    const focusInput = () => {
        inputRef.current.focus();
    };

    // 2. Persisting value without re-render
    const renderCount = useRef(0);
    
    useEffect(() => {
        renderCount.current += 1;
    });

    return (
        <div>
            <input ref={inputRef} type="text" />
            <button onClick={focusInput}>Focus Input</button>
        </div>
    );
};
```

## 9. useContext
**Ideal Answer**
`useContext` lets components consume global data without prop drilling.

```jsx
// Create context
const ThemeContext = React.createContext('light');
const UserContext = React.createContext(null);

// Provider - wrap at top level
const App = () => {
    const [theme, setTheme] = useState('light');
    const [user, setUser] = useState({ name: 'Alice', role: 'admin' });

    return (
        <ThemeContext.Provider value={{ theme, setTheme }}>
            <UserContext.Provider value={{ user, setUser }}>
                <Header />
            </UserContext.Provider>
        </ThemeContext.Provider>
    );
};

// Consumer - any nested component
const Header = () => {
    const { theme, setTheme } = useContext(ThemeContext);
    const { user } = useContext(UserContext);

    return (
        <header className={`header-${theme}`}>
            <h1>Welcome, {user.name}</h1>
            <button onClick={() => setTheme(theme === 'light' ? 'dark' : 'light')}>
                Toggle Theme
            </button>
        </header>
    );
};
```

## 10. useReducer
**Ideal Answer**
Good for complex state logic, similar to Redux reducers.

```jsx
const initialState = { count: 0 };

const reducer = (state, action) => {
    switch (action.type) {
        case 'INCREMENT':
            return { ...state, count: state.count + 1 };
        case 'DECREMENT':
            return { ...state, count: state.count - 1 };
        default:
            return state;
    }
};

const CounterWithReducer = () => {
    const [state, dispatch] = useReducer(reducer, initialState);

    return (
        <div>
            <p>Count: {state.count}</p>
            <button onClick={() => dispatch({ type: 'INCREMENT' })}>+</button>
            <button onClick={() => dispatch({ type: 'DECREMENT' })}>-</button>
        </div>
    );
};
```

## 11. Custom Hooks
**Ideal Answer**
Custom hooks let you reuse stateful logic across components.

```jsx
// Custom hook for API calls
const useFetch = (url) => {
    const [data, setData] = useState(null);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        const controller = new AbortController();

        const fetchData = async () => {
            try {
                setLoading(true);
                const response = await fetch(url, { signal: controller.signal });
                if (!response.ok) throw new Error(`HTTP error! status: ${response.status}`);
                const json = await response.json();
                setData(json);
            } catch (err) {
                if (err.name !== 'AbortError') {
                    setError(err.message);
                }
            } finally {
                setLoading(false);
            }
        };

        fetchData();
        return () => controller.abort(); // cleanup on unmount
    }, [url]);

    return { data, loading, error };
};
```

## 12. React Component Lifecycle (Class vs Hooks)
**Ideal Answer**
```jsx
// Class Component Lifecycle
class UserComponent extends React.Component {
    componentDidMount() {
        // Like useEffect(fn, []) - runs after first render
    }

    componentDidUpdate(prevProps, prevState) {
        // Like useEffect(fn, [deps]) - runs when props/state changes
    }

    componentWillUnmount() {
        // Cleanup - like useEffect return function
    }
}

// Equivalent Functional Component
const UserComponent = ({ userId }) => {
    const [data, setData] = useState(null);

    // componentDidMount & componentDidUpdate
    useEffect(() => {
        fetchData(userId).then(setData);

        // componentWillUnmount
        return () => {
            console.log('Cleanup for userId:', userId);
        };
    }, [userId]);

    return <div>{data}</div>;
};
```

## 13. State Management with Redux / Redux Toolkit
**Ideal Answer**
```jsx
// store/userSlice.js
import { createSlice, createAsyncThunk } from '@reduxjs/toolkit';

export const fetchUsers = createAsyncThunk(
    'users/fetchAll',
    async (_, { rejectWithValue }) => {
        try {
            const response = await fetch('/api/users');
            return await response.json();
        } catch (error) {
            return rejectWithValue(error.message);
        }
    }
);

const userSlice = createSlice({
    name: 'users',
    initialState: { list: [], loading: false, error: null },
    reducers: {
        addUser: (state, action) => { state.list.push(action.payload); }
    },
    extraReducers: (builder) => {
        builder
            .addCase(fetchUsers.pending, (state) => { state.loading = true; })
            .addCase(fetchUsers.fulfilled, (state, action) => {
                state.loading = false;
                state.list = action.payload;
            });
    }
});

export const { addUser } = userSlice.actions;
export default userSlice.reducer;
```

## 14. React Router
**Ideal Answer**
```jsx
import { BrowserRouter, Routes, Route, NavLink, useNavigate, useParams } from 'react-router-dom';

const App = () => (
    <BrowserRouter>
        <nav>
            <NavLink to="/">Home</NavLink>
            <NavLink to="/users">Users</NavLink>
        </nav>
        <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/users" element={<UserList />} />
            <Route path="/users/:id" element={<UserDetail />} />
            <Route path="*" element={<NotFound />} />
        </Routes>
    </BrowserRouter>
);

const UserDetail = () => {
    const { id } = useParams();
    const navigate = useNavigate();
    
    return (
        <div>
            <h1>User {id}</h1>
            <button onClick={() => navigate(-1)}>Back</button>
        </div>
    );
};
```

## 15. Promise vs Observable (in React context)
**Ideal Answer**
```jsx
// Promise - one-time async operation
const fetchUser = async (id) => {
    const response = await fetch(`/api/users/${id}`);
    return await response.json();
};

// In React with async/await
const UserComponent = ({ userId }) => {
    const [user, setUser] = useState(null);

    useEffect(() => {
        let cancelled = false;

        fetchUser(userId).then(data => {
            if (!cancelled) setUser(data);
        });

        return () => { cancelled = true; }; // prevent state update after unmount
    }, [userId]);
};
```

## 16. Performance Optimization in React
**Ideal Answer**
1. **React.memo** - prevent unnecessary re-renders for unchanged props.
2. **Code Splitting** with lazy + Suspense.
3. **Virtualization** for large lists (react-window).
4. Avoid inline objects/arrays in JSX.
5. Use stable unique **Key** props for list items.
6. Use `useMemo` and `useCallback` appropriately.

```jsx
const Dashboard = React.lazy(() => import('./Dashboard'));

const App = () => (
    <Suspense fallback={<div>Loading...</div>}>
        <Routes>
            <Route path="/dashboard" element={<Dashboard />} />
        </Routes>
    </Suspense>
);
```

## 17. Keys in Lists
**Answer:** Keys help React identify which items changed/added/removed, improving reconciliation. Use stable unique IDs, not array indexes.
```jsx
{users.map(u => <li key={u.id}>{u.name}</li>)}
```

## 18. Error Boundaries
**Ideal Answer**
```jsx
// Error boundaries must be class components
class ErrorBoundary extends React.Component {
    constructor(props) {
        super(props);
        this.state = { hasError: false, error: null };
    }

    static getDerivedStateFromError(error) {
        return { hasError: true, error };
    }

    componentDidCatch(error, errorInfo) {
        console.error('Error caught:', error, errorInfo);
    }

    render() {
        if (this.state.hasError) {
            return <h2>Something went wrong</h2>;
        }
        return this.props.children;
    }
}
```

## 19. React Forms - Controlled vs Uncontrolled
**Ideal Answer**
```jsx
// Controlled Component - React controls the input value
const ControlledForm = () => {
    const [name, setName] = useState('');
    return <input value={name} onChange={e => setName(e.target.value)} />;
};

// Uncontrolled Component - DOM controls the value
const UncontrolledForm = () => {
    const nameRef = useRef(null);
    const handleSubmit = (e) => {
        e.preventDefault();
        console.log(nameRef.current.value);
    };
    return (
        <form onSubmit={handleSubmit}>
            <input ref={nameRef} defaultValue="" />
            <button type="submit">Submit</button>
        </form>
    );
};
```

## 20. API Integration with React Query (TanStack Query)
**Ideal Answer**
React Query handles caching, background refetching, and synchronization.

```jsx
import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';

const fetchUsers = async () => {
    const res = await fetch('/api/users');
    return res.json();
};

const UserList = () => {
    const { data: users, isLoading, isError } = useQuery({
        queryKey: ['users'],
        queryFn: fetchUsers,
        staleTime: 5 * 60 * 1000, // 5 minutes
    });

    if (isLoading) return <div>Loading...</div>;
    if (isError) return <div>Error loading users</div>;

    return <ul>{users.map(user => <li key={user.id}>{user.name}</li>)}</ul>;
};
```

## 21. Difference between @PathVariable and @RequestParam (Java - cross reference)
**Ideal Answer**
```java
// @PathVariable - extracts value from URI path
@GetMapping("/users/{id}") // URL: /users/123

// @RequestParam - extracts from query string
@GetMapping("/users") // URL: /users?page=0&size=10
```

## 22. Routing in React vs Navigation in Spring MVC
**Ideal Answer**
React handles client-side routing (browser URL changes but no server request, instant switching). Spring MVC handles server-side routing (each URL hits the server which returns specific data or views).

## 23. CORS Handling
**Ideal Answer**
```jsx
// React - Proxy setup for development (package.json)
{
  "proxy": "http://localhost:8080"
}
```
```java
// Spring Boot Backend
@CrossOrigin(origins = "http://localhost:3000")
@RestController
public class UserController { }
```

## 24. React Project Architecture Best Practices
**Ideal Answer**
```
src/
├── api/              # API calls, axios instances
├── components/       # Reusable UI components
├── hooks/            # Custom hooks
├── pages/            # Route-level components
├── store/            # Redux store / context
├── utils/            # Helper functions
├── constants/        # App constants
└── App.jsx
```

## 25. Authentication Flow in React + Spring Boot
**Ideal Answer**
1. User sends credentials.
2. Backend validates & returns JWT.
3. React stores token (localStorage / context).
4. Every protected request attaches token via Axios interceptors.
5. Backend validates token and serves data.

## 26. React + TypeScript
**Answer:** TypeScript adds type safety to props and state.
```tsx
interface Props { name: string; age: number; }
function User({ name, age }: Props) { return <div>{name} - {age}</div>; }
```

## 27. How would you handle a large list / 1 lakh records?
**Answer:** Use server-side pagination, infinite scrolling/lazy loading, and UI virtualization libraries like `react-window` or `react-virtualized` so only the visible rows are rendered in the DOM.

## 28. Why React? (Infosys Specific)
**Ideal Answer**
React is chosen for enterprise projects because:
1. **Component reusability** - Build once, use everywhere
2. **Virtual DOM** - Efficient rendering for complex UIs
3. **Large ecosystem** - Redux, React Query, React Router, Material UI
4. **Flexibility** - Can integrate with any backend
5. **Performance** - Hooks, lazy loading, memoization
6. **Community & support** - Large community, backed by Meta
For enterprise clients, React's scalability and component-driven approach make it ideal for complex dashboards and applications.


# Infosys React Interview Questions — Ideal Answers

> Generated from `uploads/infosys_react_interview_questions.md`.
> Use the HR answers as templates and customize them with your actual projects, role, and metrics.

---

## SECTION 1: React Fundamentals

### Core Concepts

#### 1. What is React? How is it different from Angular or Vue?
**Ideal answer:** React is a JavaScript library for building component-based user interfaces. It focuses mainly on the view layer and uses a declarative programming model: we describe what UI should look like for a given state, and React updates the DOM efficiently. Angular is a full framework with built-in routing, forms, dependency injection, and strong TypeScript conventions. Vue is a progressive framework that is easier to adopt gradually and includes official solutions for routing/state. React is flexible, has a large ecosystem, and lets teams choose supporting libraries.

#### 2. What is JSX? Why do we use it instead of plain JavaScript?
**Ideal answer:** JSX is a syntax extension that lets us write HTML-like UI inside JavaScript. It is compiled to `React.createElement()` calls. JSX is used because it is readable, keeps component UI and logic close together, supports JavaScript expressions using `{}`, and helps React escape values by default to reduce XSS risk.

```jsx
const name = "Infosys";
const element = <h1>Hello, {name}</h1>;
```

#### 3. What is the Virtual DOM? How does React use it to improve performance?
**Ideal answer:** The Virtual DOM is an in-memory JavaScript representation of the real DOM. When state or props change, React creates a new virtual tree, compares it with the previous tree using reconciliation, calculates the minimum changes required, and updates only those parts in the real DOM. This reduces direct DOM manipulation, which is usually expensive.

#### 4. What is the difference between a Functional Component and a Class Component?
**Ideal answer:** A functional component is a JavaScript function that returns JSX. Modern React uses hooks like `useState` and `useEffect` for state and lifecycle behavior. A class component extends `React.Component`, uses `this.state`, `this.setState`, and lifecycle methods like `componentDidMount`. Functional components are preferred today because they are simpler, easier to test, and work well with hooks.

```jsx
function Welcome({ name }) {
  return <h1>Hello {name}</h1>;
}
```

#### 5. What are `props`? Are they mutable?
**Ideal answer:** Props are inputs passed from a parent component to a child component. They are read-only from the child component's perspective. A child should not mutate props directly; if it needs to change something, it should call a callback passed by the parent or manage its own state.

#### 6. What is `state` in React? How is it different from `props`?
**Ideal answer:** State is data managed inside a component that can change over time. Updating state triggers a re-render. Props are passed from parent to child and should be treated as immutable. In short: props are external inputs, state is internal component data.

#### 7. What is the difference between controlled and uncontrolled components?
**Ideal answer:** In a controlled component, form data is controlled by React state. In an uncontrolled component, the DOM maintains the value and React accesses it using refs when needed.

```jsx
function ControlledInput() {
  const [name, setName] = React.useState("");
  return <input value={name} onChange={(e) => setName(e.target.value)} />;
}

function UncontrolledInput() {
  const inputRef = React.useRef(null);
  const submit = () => alert(inputRef.current.value);
  return <><input ref={inputRef} /><button onClick={submit}>Submit</button></>;
}
```

#### 8. What are keys in React? Why are they important in lists?
**Ideal answer:** Keys are unique identifiers used by React to track list items between renders. They help React know which items changed, were added, or were removed. Stable keys improve performance and prevent UI bugs such as incorrect input values being preserved. Avoid using array index as a key when the list can be reordered, inserted, or deleted.

```jsx
users.map((user) => <li key={user.id}>{user.name}</li>);
```

#### 9. How does React handle events? How is it different from regular HTML events?
**Ideal answer:** React uses Synthetic Events, which are wrappers around browser events that provide consistent behavior across browsers. React event names use camelCase, and handlers are passed as functions instead of strings.

```jsx
<button onClick={handleClick}>Click</button>
```

In HTML it would be `onclick="handleClick()"`, but in React it is `onClick={handleClick}`.

#### 10. What is `React.Fragment`? When would you use it?
**Ideal answer:** `React.Fragment` lets a component return multiple elements without adding an extra DOM node. It is useful when extra wrapper elements would break layout, styling, or semantic HTML.

```jsx
return (
  <>
    <td>Name</td>
    <td>Email</td>
  </>
);
```

---

### React Hooks

#### 11. What are React Hooks? Why were they introduced?
**Ideal answer:** Hooks are functions that let functional components use React features such as state, lifecycle behavior, refs, context, and reducers. They were introduced to reduce the need for class components, improve code reuse through custom hooks, and make components simpler and more readable.

#### 12. What is `useState`? Give an example of a counter component.
**Ideal answer:** `useState` is a hook used to add state to functional components. It returns the current state value and a setter function.

```jsx
function Counter() {
  const [count, setCount] = React.useState(0);

  return (
    <div>
      <p>Count: {count}</p>
      <button onClick={() => setCount((c) => c + 1)}>Increment</button>
    </div>
  );
}
```

#### 13. What is `useEffect`? How does it replicate lifecycle methods?
**Ideal answer:** `useEffect` runs side effects after rendering, such as API calls, subscriptions, timers, and manually interacting with the DOM. It can behave like class lifecycle methods depending on the dependency array.

```jsx
// componentDidMount: runs once after first render
useEffect(() => {
  console.log("Mounted");
}, []);

// componentWillUnmount: cleanup
useEffect(() => {
  const id = setInterval(() => console.log("tick"), 1000);
  return () => clearInterval(id);
}, []);

// componentDidUpdate for a specific dependency
useEffect(() => {
  console.log("Search changed:", searchText);
}, [searchText]);
```

#### 14. What is `useRef`? Give two use cases.
**Ideal answer:** `useRef` returns a mutable object whose `.current` value persists across renders. Updating a ref does not cause a re-render. Common use cases are accessing DOM elements and storing mutable values like timer IDs or previous values.

```jsx
function SearchBox() {
  const inputRef = React.useRef(null);
  const renderCount = React.useRef(0);

  renderCount.current += 1;

  return (
    <>
      <input ref={inputRef} />
      <button onClick={() => inputRef.current.focus()}>Focus</button>
      <p>Rendered {renderCount.current} times</p>
    </>
  );
}
```

#### 15. What is `useCallback`? When should you use it?
**Ideal answer:** `useCallback` memoizes a function reference and recreates it only when dependencies change. It is useful when passing callbacks to memoized child components or when a function is used as a dependency in another hook. It should not be used everywhere because memoization also has overhead.

```jsx
const handleDelete = React.useCallback((id) => {
  setItems((items) => items.filter((item) => item.id !== id));
}, []);
```

#### 16. What is `useMemo`? How is it different from `useCallback`?
**Ideal answer:** `useMemo` memoizes a computed value, while `useCallback` memoizes a function. `useMemo` is useful for expensive calculations; `useCallback(fn, deps)` is basically similar to `useMemo(() => fn, deps)`.

```jsx
const filteredUsers = React.useMemo(() => {
  return users.filter((u) => u.name.toLowerCase().includes(query.toLowerCase()));
}, [users, query]);
```

#### 17. What is `useContext`? How does it help avoid prop drilling?
**Ideal answer:** `useContext` allows a component to consume data from a React Context directly instead of receiving it through many intermediate props. It is useful for global-like data such as theme, authentication user, locale, or feature flags.

```jsx
const ThemeContext = React.createContext("light");

function Button() {
  const theme = React.useContext(ThemeContext);
  return <button className={theme}>Save</button>;
}
```

#### 18. What is `useReducer`? When would you prefer it over `useState`?
**Ideal answer:** `useReducer` manages state using a reducer function and actions. It is preferred when state logic is complex, when multiple state values change together, or when updates depend on action types.

```jsx
function reducer(state, action) {
  switch (action.type) {
    case "increment": return { count: state.count + 1 };
    case "decrement": return { count: state.count - 1 };
    default: return state;
  }
}

function Counter() {
  const [state, dispatch] = React.useReducer(reducer, { count: 0 });
  return <button onClick={() => dispatch({ type: "increment" })}>{state.count}</button>;
}
```

#### 19. Can you write a custom hook? Write one that fetches data from an API.
**Ideal answer:** A custom hook is a reusable function whose name starts with `use` and can call other hooks. It helps extract repeated logic from components.

```jsx
function useFetch(url) {
  const [data, setData] = React.useState(null);
  const [loading, setLoading] = React.useState(true);
  const [error, setError] = React.useState(null);

  React.useEffect(() => {
    const controller = new AbortController();

    async function load() {
      try {
        setLoading(true);
        const res = await fetch(url, { signal: controller.signal });
        if (!res.ok) throw new Error("Request failed");
        setData(await res.json());
      } catch (err) {
        if (err.name !== "AbortError") setError(err.message);
      } finally {
        setLoading(false);
      }
    }

    load();
    return () => controller.abort();
  }, [url]);

  return { data, loading, error };
}
```

#### 20. What are the rules of hooks?
**Ideal answer:** Hooks must be called only at the top level of a React function component or custom hook. Do not call hooks inside loops, conditions, nested functions, or regular JavaScript functions. Dependencies in hooks like `useEffect`, `useMemo`, and `useCallback` should be listed correctly to avoid stale values.

---

### Component Lifecycle

#### 21. What are the lifecycle methods in a Class Component?
**Ideal answer:** Common class lifecycle methods are `componentDidMount` for code after first render, `componentDidUpdate` for updates after props/state changes, and `componentWillUnmount` for cleanup. Other methods include `shouldComponentUpdate`, `getDerivedStateFromProps`, `getSnapshotBeforeUpdate`, and error boundary methods like `componentDidCatch`.

#### 22. How does `useEffect` map to lifecycle methods in functional components?
**Ideal answer:** `useEffect(() => {}, [])` is similar to `componentDidMount`. `useEffect(() => {}, [value])` is similar to running update logic when `value` changes. Returning a cleanup function from `useEffect` is similar to `componentWillUnmount` or cleanup before the next effect run.

#### 23. What is the order of execution when a component re-renders?
**Ideal answer:** A re-render starts when state, props, or context changes. React calls the component function again, recalculates JSX, compares the new virtual tree with the previous one, commits required DOM changes, and then runs effects. For an effect whose dependencies changed, React first runs the previous cleanup and then runs the new effect.

#### 24. What triggers a re-render in React?
**Ideal answer:** Re-renders are triggered by state updates, new props from a parent, context value changes, and sometimes parent re-renders. Calling `setState` with the same value may be skipped by React for primitive values, but object/array references usually cause updates if a new reference is provided.

---

## SECTION 2: State Management

#### 25. What is prop drilling? How do you solve it?
**Ideal answer:** Prop drilling means passing props through multiple intermediate components that do not actually use them. It can be solved by component composition, Context API, state management libraries like Redux/Zustand, or colocating state closer to where it is used.

#### 26. What is the Context API? When would you use it vs Redux?
**Ideal answer:** Context API shares values across a component tree without manually passing props. It is good for relatively simple global data like theme, auth user, or language. Redux is better when the app has complex global state, many update flows, debugging requirements, middleware, caching patterns, or predictable state transitions at scale.

#### 27. What is Redux? Explain Store, Action, Reducer, Dispatch.
**Ideal answer:** Redux is a predictable state management library. The store holds global state. An action is a plain object describing what happened. A reducer is a pure function that receives current state and action and returns new state. Dispatch sends actions to the store so reducers can update state.

#### 28. What is the Redux flow?
**Ideal answer:** The usual Redux flow is: UI dispatches an action → reducer processes the action → store updates state → subscribed components re-render with the new state. In async cases, middleware like Redux Thunk handles API calls before dispatching success or failure actions.

#### 29. What is `useSelector` and `useDispatch`?
**Ideal answer:** `useSelector` reads data from the Redux store, and `useDispatch` returns the dispatch function used to send actions.

```jsx
const count = useSelector((state) => state.counter.value);
const dispatch = useDispatch();

<button onClick={() => dispatch(increment())}>+</button>
```

#### 30. What is Redux Thunk / Redux Saga? When do you use middleware?
**Ideal answer:** Middleware is used for side effects such as API calls, logging, analytics, or conditional dispatching. Redux Thunk lets action creators return functions for async logic. Redux Saga uses generator functions and is useful for complex async flows such as cancellation, retries, polling, and orchestrating multiple actions.

#### 31. What is the difference between local state, global state, and server state?
**Ideal answer:** Local state belongs to one component or a small part of the UI, such as modal visibility. Global state is shared across many unrelated components, such as authenticated user details. Server state comes from a backend and has concerns like caching, refetching, loading, errors, synchronization, and invalidation; libraries like TanStack Query handle server state well.

#### 32. Have you used Zustand or Jotai? How do they compare to Redux?
**Ideal answer:** Zustand is a lightweight store-based state library with minimal boilerplate. Jotai uses an atom-based model where small independent pieces of state can be combined. Redux is more structured and has excellent DevTools, middleware, and conventions, but it can be more verbose. For small or medium apps, Zustand/Jotai can be simpler; for large enterprise apps, Redux Toolkit is still a strong choice.

---

## SECTION 3: Performance Optimization

#### 33. How do you prevent unnecessary re-renders in React?
**Ideal answer:** I prevent unnecessary re-renders by colocating state, splitting components, using stable keys, avoiding inline object/function props when needed, memoizing expensive calculations with `useMemo`, memoizing callbacks with `useCallback`, wrapping pure child components with `React.memo`, using virtualization for large lists, and profiling before optimizing.

#### 34. What is `React.memo`? How does it work?
**Ideal answer:** `React.memo` is a higher-order component that memoizes a functional component. It skips re-rendering if props are shallowly equal. It is useful for pure components that receive stable props.

```jsx
const UserRow = React.memo(function UserRow({ user, onSelect }) {
  return <li onClick={() => onSelect(user.id)}>{user.name}</li>;
});
```

#### 35. What is `PureComponent` in class components? How does it relate to `React.memo`?
**Ideal answer:** `React.PureComponent` is a class component that implements shallow comparison of props and state to avoid unnecessary renders. `React.memo` provides similar optimization for functional components.

#### 36. What is lazy loading in React? How do you implement it?
**Ideal answer:** Lazy loading means loading a component only when it is needed, reducing the initial JavaScript bundle size. React supports this using `React.lazy` and `Suspense`.

```jsx
const AdminPage = React.lazy(() => import("./AdminPage"));

function App() {
  return (
    <React.Suspense fallback={<p>Loading...</p>}>
      <AdminPage />
    </React.Suspense>
  );
}
```

#### 37. What is code splitting? How does it improve performance?
**Ideal answer:** Code splitting breaks the app bundle into smaller chunks that can be loaded on demand. It improves first-load performance because users download only the code needed for the current route or feature instead of the entire application upfront.

#### 38. What is virtualization? What library do you use for large lists?
**Ideal answer:** Virtualization renders only the visible rows/items in a large list and a small buffer around them, instead of rendering thousands of DOM nodes. This improves rendering performance and memory usage. Common libraries are `react-window`, `react-virtual`, and `react-virtualized`.

#### 39. What is `shouldComponentUpdate`? When would you override it?
**Ideal answer:** `shouldComponentUpdate` is a class lifecycle method that decides whether a component should re-render. You override it for performance optimization when you can determine that a render is unnecessary. In modern React, `React.memo`, `useMemo`, and `useCallback` are more common in functional components.

#### 40. Explain the difference between `useCallback` and `useMemo` with a performance example.
**Ideal answer:** `useCallback` returns a memoized function, while `useMemo` returns a memoized computed value. Example: use `useMemo` to avoid recalculating filtered data, and `useCallback` to avoid passing a new callback reference to a memoized child.

```jsx
const visibleUsers = useMemo(
  () => users.filter((u) => u.active),
  [users]
);

const selectUser = useCallback((id) => {
  setSelectedId(id);
}, []);

return <UserList users={visibleUsers} onSelect={selectUser} />;
```

#### 41. What is debouncing and throttling? How do you implement them in React?
**Ideal answer:** Debouncing delays execution until the user stops triggering an event for a specified time, useful for search input. Throttling limits execution to once per interval, useful for scroll/resize handlers.

```jsx
function useDebouncedValue(value, delay = 400) {
  const [debounced, setDebounced] = React.useState(value);

  React.useEffect(() => {
    const id = setTimeout(() => setDebounced(value), delay);
    return () => clearTimeout(id);
  }, [value, delay]);

  return debounced;
}
```

#### 42. How do you profile a React app's performance?
**Ideal answer:** I use React DevTools Profiler to record interactions and identify components that render frequently or take too long. I also use browser Performance tools, Lighthouse, bundle analyzers, and production monitoring. After identifying bottlenecks, I optimize with memoization, code splitting, virtualization, or state restructuring.

---

## SECTION 4: Routing

#### 43. What is React Router? What is the difference between v5 and v6?
**Ideal answer:** React Router is a routing library for single-page React apps. In v6, `Switch` was replaced by `Routes`, `component`/`render` props were replaced by `element`, route matching became more predictable, nested routes improved with `Outlet`, and `useHistory` was replaced by `useNavigate`.

#### 44. What is the difference between `BrowserRouter` and `HashRouter`?
**Ideal answer:** `BrowserRouter` uses the HTML5 History API and produces clean URLs like `/products/1`, but the server must be configured to return `index.html` for all routes. `HashRouter` uses the URL hash like `/#/products/1`, which does not require server-side routing support but looks less clean.

#### 45. How do you implement protected/private routes in React?
**Ideal answer:** A protected route checks authentication before rendering the page. If the user is not authenticated, it redirects them to login.

```jsx
import { Navigate, Outlet } from "react-router-dom";

function ProtectedRoute({ isLoggedIn }) {
  return isLoggedIn ? <Outlet /> : <Navigate to="/login" replace />;
}

// <Route element={<ProtectedRoute isLoggedIn={auth} />}>
//   <Route path="/dashboard" element={<Dashboard />} />
// </Route>
```

#### 46. What is `useNavigate`? How is it different from `useHistory`?
**Ideal answer:** `useNavigate` is a React Router v6 hook used for programmatic navigation. It replaces `useHistory` from v5. Instead of `history.push('/home')`, v6 uses `navigate('/home')`; instead of `history.goBack()`, it uses `navigate(-1)`.

#### 47. How do you pass data between routes?
**Ideal answer:** Data can be passed through URL params, query params, route state, or global state. URL params are best for resource IDs, query params for filters/search, and route state for temporary navigation data.

```jsx
navigate("/users/10?tab=profile", { state: { from: "dashboard" } });
```

#### 48. What is `useParams` and `useSearchParams`?
**Ideal answer:** `useParams` reads dynamic path parameters such as `/users/:id`. `useSearchParams` reads and updates query string values.

```jsx
const { id } = useParams();
const [searchParams] = useSearchParams();
const tab = searchParams.get("tab");
```

#### 49. What is lazy loading of routes? How do you set it up?
**Ideal answer:** Lazy loading routes means route components are downloaded only when the route is visited. It is implemented with dynamic imports, `React.lazy`, and `Suspense`.

```jsx
const Reports = React.lazy(() => import("./Reports"));

<Route
  path="/reports"
  element={
    <React.Suspense fallback={<p>Loading route...</p>}>
      <Reports />
    </React.Suspense>
  }
/>
```

---

## SECTION 5: API Integration & Async Handling

#### 50. How do you fetch data in React?
**Ideal answer:** In functional components, API calls are commonly made inside `useEffect` for initial loading or when dependencies change. We can use `fetch`, `axios`, or libraries like TanStack Query.

```jsx
useEffect(() => {
  async function loadUsers() {
    const res = await fetch("/api/users");
    const data = await res.json();
    setUsers(data);
  }
  loadUsers();
}, []);
```

#### 51. How do you handle loading and error states when fetching data?
**Ideal answer:** I maintain separate `loading`, `error`, and `data` states. The UI should show a spinner/skeleton while loading, a useful error message on failure, and the actual content on success.

```jsx
if (loading) return <p>Loading...</p>;
if (error) return <p role="alert">{error}</p>;
return <UserList users={users} />;
```

#### 52. What is the correct place to make API calls in a functional component?
**Ideal answer:** API calls should not be made directly during rendering because rendering must stay pure. They should be made in `useEffect`, event handlers, route loaders/framework APIs, or a data-fetching library like TanStack Query.

#### 53. What is the problem with calling `setState` inside `useEffect` without a cleanup?
**Ideal answer:** If an async effect finishes after a component unmounts, calling `setState` can cause stale updates and memory-leak-like behavior. Also, if dependencies are wrong, `setState` inside `useEffect` can create an infinite render loop. Cleanup with `AbortController`, flags, or request IDs helps avoid stale updates.

#### 54. What is React Query / TanStack Query? How does it simplify data fetching?
**Ideal answer:** TanStack Query manages server state: fetching, caching, loading/error states, retries, refetching, pagination, background updates, and cache invalidation. It reduces manual `useEffect` code and keeps server data synchronized.

```jsx
const { data, isLoading, error } = useQuery({
  queryKey: ["users"],
  queryFn: () => fetch("/api/users").then((r) => r.json())
});
```

#### 55. How do you handle race conditions in API calls inside `useEffect`?
**Ideal answer:** Race conditions happen when older requests finish after newer requests and overwrite newer data. I handle them by aborting previous requests, using a cleanup flag, or tracking request IDs.

```jsx
useEffect(() => {
  let ignore = false;

  fetch(`/api/search?q=${query}`)
    .then((r) => r.json())
    .then((data) => { if (!ignore) setResults(data); });

  return () => { ignore = true; };
}, [query]);
```

#### 56. What is an `AbortController`? How do you use it with `useEffect`?
**Ideal answer:** `AbortController` is a browser API that cancels fetch requests. In React, it is useful in effect cleanup to cancel in-flight requests when the component unmounts or dependencies change.

```jsx
useEffect(() => {
  const controller = new AbortController();

  fetch("/api/users", { signal: controller.signal })
    .then((r) => r.json())
    .then(setUsers)
    .catch((err) => {
      if (err.name !== "AbortError") setError(err.message);
    });

  return () => controller.abort();
}, []);
```

---

## SECTION 6: Forms

#### 57. What is the difference between a controlled and uncontrolled form in React?
**Ideal answer:** In a controlled form, field values are stored in React state and updated through `onChange`. This gives full control over validation and UI behavior. In an uncontrolled form, values are stored in the DOM and accessed through refs, which can be simpler for quick forms or file inputs.

#### 58. How do you validate a form in React?
**Ideal answer:** Form validation can be manual using state and conditions, or library-based using Formik, React Hook Form, Yup, or Zod. For small forms, manual validation is fine. For large enterprise forms, React Hook Form with schema validation is efficient and maintainable.

```jsx
const error = email.includes("@") ? "" : "Invalid email";
```

#### 59. What is `React Hook Form`? What are its advantages over Formik?
**Ideal answer:** React Hook Form is a form library that uses uncontrolled inputs and refs to reduce re-renders. It is lightweight, fast, easy to integrate with schema validators, and generally requires less boilerplate than Formik. Formik is also good, but it often relies more heavily on controlled state.

#### 60. How do you handle file uploads in a React form?
**Ideal answer:** File inputs are usually uncontrolled. We read the selected file from `event.target.files`, append it to `FormData`, and send it using `fetch` or `axios` with `multipart/form-data`.

```jsx
async function upload(e) {
  const file = e.target.files[0];
  const formData = new FormData();
  formData.append("file", file);

  await fetch("/api/upload", {
    method: "POST",
    body: formData
  });
}

<input type="file" onChange={upload} />
```

---

## SECTION 7: Advanced Concepts

#### 61. What are Higher-Order Components? Give an example.
**Ideal answer:** A Higher-Order Component is a function that takes a component and returns an enhanced component. It is used for cross-cutting logic like authentication, logging, permissions, or data injection. Hooks have replaced many HOC use cases, but HOCs still exist in libraries.

```jsx
function withAuth(Component) {
  return function Protected(props) {
    const isLoggedIn = useAuth();
    return isLoggedIn ? <Component {...props} /> : <Navigate to="/login" />;
  };
}
```

#### 62. What is the Render Props pattern?
**Ideal answer:** Render Props is a pattern where a component receives a function prop and uses it to decide what to render. It shares logic while allowing flexible rendering.

```jsx
function MouseTracker({ render }) {
  const [pos, setPos] = React.useState({ x: 0, y: 0 });
  return <div onMouseMove={(e) => setPos({ x: e.clientX, y: e.clientY })}>{render(pos)}</div>;
}

<MouseTracker render={({ x, y }) => <p>{x}, {y}</p>} />;
```

#### 63. What is the Compound Component pattern?
**Ideal answer:** Compound components are multiple components designed to work together under a shared parent. The parent manages shared state and children consume it through context. Examples include `Tabs`, `Accordion`, and `Select`.

```jsx
<Tabs>
  <Tabs.List />
  <Tabs.Panel />
</Tabs>
```

#### 64. What are Error Boundaries? How do you implement one?
**Ideal answer:** Error Boundaries catch JavaScript errors during rendering, lifecycle methods, and constructors of child components. They prevent the entire app from crashing and show fallback UI. They must currently be class components.

```jsx
class ErrorBoundary extends React.Component {
  state = { hasError: false };

  static getDerivedStateFromError() {
    return { hasError: true };
  }

  componentDidCatch(error, info) {
    console.error(error, info);
  }

  render() {
    if (this.state.hasError) return <h2>Something went wrong.</h2>;
    return this.props.children;
  }
}
```

#### 65. What is `React.createPortal`? When would you use it?
**Ideal answer:** `createPortal` renders children into a DOM node outside the parent component's DOM hierarchy while keeping them in the same React tree. It is useful for modals, tooltips, dropdowns, and overlays.

```jsx
return ReactDOM.createPortal(
  <div className="modal">Modal content</div>,
  document.getElementById("modal-root")
);
```

#### 66. What is `React.StrictMode`? What does it detect?
**Ideal answer:** `React.StrictMode` is a development-only wrapper that helps detect unsafe lifecycle methods, legacy APIs, accidental side effects, and improper cleanup. In React 18 development, it may intentionally run some functions/effects twice to reveal side-effect bugs.

#### 67. What is reconciliation in React? How does the diffing algorithm work?
**Ideal answer:** Reconciliation is the process of comparing the previous and new virtual DOM trees and deciding what real DOM updates are needed. React assumes elements of different types produce different trees. For lists, keys help React match elements correctly. This makes updates efficient without comparing every possible tree combination.

#### 68. What is concurrent rendering in React 18? What is `startTransition`?
**Ideal answer:** Concurrent rendering lets React prepare multiple UI updates and interrupt low-priority work to keep the interface responsive. `startTransition` marks updates as non-urgent, such as filtering a large list, so urgent updates like typing remain responsive.

```jsx
const [query, setQuery] = useState("");
const [listQuery, setListQuery] = useState("");

function handleChange(e) {
  setQuery(e.target.value); // urgent
  startTransition(() => {
    setListQuery(e.target.value); // non-urgent
  });
}
```

#### 69. What are Server Components in React? How are they different from Client Components?
**Ideal answer:** Server Components render on the server and can access server-only resources such as databases without sending their JavaScript to the client. Client Components run in the browser and can use state, effects, event handlers, and browser APIs. Server Components reduce client bundle size, while Client Components handle interactivity.

#### 70. What is `Suspense` in React? How does it work with data fetching?
**Ideal answer:** `Suspense` lets React show fallback UI while a child component is waiting for something, commonly lazy-loaded code and, in supported frameworks/libraries, data. A component suspends by throwing a promise internally; React shows the nearest fallback until it resolves.

```jsx
<Suspense fallback={<Spinner />}>
  <LazyPage />
</Suspense>
```

---

## SECTION 8: Testing

#### 71. What testing libraries do you use for React?
**Ideal answer:** Common tools are Jest or Vitest as the test runner/assertion framework, React Testing Library for rendering components and testing user behavior, MSW for API mocking, and Cypress or Playwright for end-to-end tests.

#### 72. What is the difference between unit testing and integration testing in React?
**Ideal answer:** Unit tests verify a small isolated function or component. Integration tests verify multiple parts working together, such as a form component calling validation and showing results after an API response. React Testing Library encourages testing from the user's perspective rather than implementation details.

#### 73. How do you test a component that fetches data from an API?
**Ideal answer:** I mock the API using MSW or mock `fetch`, render the component, assert loading UI first, wait for the data, and verify success or error states.

```jsx
test("shows users", async () => {
  global.fetch = vi.fn(() =>
    Promise.resolve({ json: () => Promise.resolve([{ id: 1, name: "Asha" }]) })
  );

  render(<Users />);
  expect(screen.getByText(/loading/i)).toBeInTheDocument();
  expect(await screen.findByText("Asha")).toBeInTheDocument();
});
```

#### 74. What is mocking? How do you mock an API call in Jest?
**Ideal answer:** Mocking replaces real dependencies with fake implementations during tests. It avoids real network calls and makes tests predictable. In Jest, we can mock `fetch`, `axios`, modules, timers, or functions.

```jsx
jest.spyOn(global, "fetch").mockResolvedValue({
  json: async () => ({ name: "Test User" })
});
```

#### 75. What is `@testing-library/react`? What are `render`, `screen`, `fireEvent`, `userEvent`?
**Ideal answer:** `@testing-library/react` is a testing utility focused on testing components like users interact with them. `render` mounts a component in a test DOM. `screen` provides queries like `getByRole`. `fireEvent` triggers low-level DOM events. `userEvent` simulates more realistic user interactions such as typing and clicking.

---

## SECTION 9: JavaScript Fundamentals

#### 76. What is the difference between `var`, `let`, and `const`?
**Ideal answer:** `var` is function-scoped and hoisted with `undefined`. `let` and `const` are block-scoped and hoisted but stay in the temporal dead zone until initialized. `const` prevents reassignment of the variable binding, but objects declared with `const` can still have their properties changed.

#### 77. What is a closure? Give a real-world example.
**Ideal answer:** A closure is when an inner function remembers variables from its outer function even after the outer function has finished executing. It is useful for data privacy, callbacks, and function factories.

```js
function createCounter() {
  let count = 0;
  return function increment() {
    count += 1;
    return count;
  };
}
const counter = createCounter();
counter(); // 1
counter(); // 2
```

#### 78. What is the event loop in JavaScript?
**Ideal answer:** The event loop is the mechanism that allows JavaScript to handle asynchronous tasks despite being single-threaded. Synchronous code runs on the call stack. Async callbacks go to task queues. Microtasks like promises run before macrotasks like `setTimeout` after the current stack is empty.

#### 79. What is the difference between `==` and `===`?
**Ideal answer:** `==` compares values after type coercion, while `===` compares both value and type without coercion. In production code, `===` is preferred because it is predictable.

```js
0 == false;  // true
0 === false; // false
```

#### 80. What is `this` in JavaScript? How does it behave in arrow functions vs regular functions?
**Ideal answer:** In regular functions, `this` depends on how the function is called. In arrow functions, `this` is lexically captured from the surrounding scope. That makes arrow functions useful for callbacks where we want to preserve outer `this`.

#### 81. What is `Promise`? What is `async/await`? How do you handle errors in async/await?
**Ideal answer:** A Promise represents a future async result that can be pending, fulfilled, or rejected. `async/await` is syntax that makes promise-based code look synchronous. Errors are handled using `try/catch`.

```js
async function loadUser() {
  try {
    const res = await fetch("/api/user");
    return await res.json();
  } catch (err) {
    console.error("Failed", err);
    throw err;
  }
}
```

#### 82. What is destructuring in JavaScript? Spread vs rest operator?
**Ideal answer:** Destructuring extracts values from arrays or objects. Spread expands values into another array/object/function call. Rest collects remaining values into an array or object.

```js
const { name, age } = user;        // destructuring
const copy = { ...user };          // spread
const [first, ...others] = users;  // rest
```

#### 83. What is hoisting in JavaScript?
**Ideal answer:** Hoisting means declarations are processed before code execution. `var` declarations are hoisted and initialized with `undefined`. Function declarations are fully hoisted. `let` and `const` are hoisted but cannot be used before initialization due to the temporal dead zone.

#### 84. What is the difference between `null` and `undefined`?
**Ideal answer:** `undefined` usually means a variable was declared but not assigned, or a property does not exist. `null` is an intentional assignment meaning no value. `typeof undefined` is `"undefined"`, while `typeof null` is historically `"object"`.

#### 85. What are JavaScript array methods you commonly use?
**Ideal answer:** Common methods include `map` for transforming, `filter` for selecting, `reduce` for accumulating, `find` for first matching item, `some` for checking if any item matches, and `every` for checking if all items match.

```js
const activeNames = users
  .filter((u) => u.active)
  .map((u) => u.name);

const total = orders.reduce((sum, order) => sum + order.amount, 0);
```

---

## SECTION 10: CSS & Layout

#### 86. What is the difference between Flexbox and CSS Grid?
**Ideal answer:** Flexbox is mainly one-dimensional: it lays items in a row or column. CSS Grid is two-dimensional: it handles rows and columns together. I use Flexbox for alignment and small layouts like navbars, and Grid for full page or card layouts.

#### 87. What is the difference between `position: relative`, `absolute`, `fixed`, and `sticky`?
**Ideal answer:** `relative` keeps the element in normal flow but allows offset. `absolute` positions relative to the nearest positioned ancestor. `fixed` positions relative to the viewport and stays during scroll. `sticky` behaves like relative until a threshold, then sticks like fixed within its container.

#### 88. What are CSS-in-JS solutions?
**Ideal answer:** CSS-in-JS libraries such as Styled Components and Emotion let us write component-scoped styles in JavaScript. They support dynamic styling based on props, theme integration, and automatic class name generation. Downsides can include runtime overhead and tooling complexity.

#### 89. What is Tailwind CSS? How is it different from Bootstrap?
**Ideal answer:** Tailwind CSS is a utility-first CSS framework where we compose designs using small classes like `flex`, `p-4`, and `text-lg`. Bootstrap provides ready-made components and a predefined design system. Tailwind gives more design flexibility; Bootstrap is faster for standard UI prototypes.

#### 90. What is responsive design? How do you implement it in React?
**Ideal answer:** Responsive design means the UI works well on different screen sizes. I implement it using CSS media queries, flexible layouts with Flexbox/Grid, relative units, responsive images, and conditional rendering only when necessary.

```css
.grid {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
}
@media (max-width: 768px) {
  .grid { grid-template-columns: 1fr; }
}
```

---

## SECTION 11: HR Round

#### 91. Tell me about yourself and your React projects.
**Ideal answer:** I am a frontend developer focused on building responsive, maintainable React applications. In my recent project, I worked on components, routing, API integration, form validation, and performance improvements. I used React hooks, React Router, reusable components, and state management based on project needs. I also collaborated with backend and QA teams to deliver features end to end. I am now looking for an opportunity where I can contribute to enterprise-scale applications and continue growing technically.

#### 92. What was the most complex React feature you implemented?
**Ideal answer:** One complex feature I implemented was a dynamic dashboard with filters, pagination, API-driven data, and role-based UI. The main challenges were avoiding unnecessary API calls, handling loading/error states, and keeping the UI responsive. I solved it using debounced search, memoized filtered data, reusable components, and clear separation between API logic and presentation components.

#### 93. How do you stay updated with new React features?
**Ideal answer:** I follow the official React documentation, release notes, technical blogs, GitHub discussions, and community resources. I also build small proof-of-concept projects to understand features like Suspense, concurrent rendering, and Server Components before using them in production.

#### 94. Describe a bug in React you spent a long time fixing. How did you solve it?
**Ideal answer:** In one project, a search result list sometimes showed stale data. The issue was a race condition where an older API request completed after a newer request. I reproduced it using slow network throttling, identified the stale response in DevTools, and fixed it using `AbortController`/cleanup in `useEffect`. This ensured only the latest request updated state.

#### 95. Why do you want to join Infosys?
**Ideal answer:** I want to join Infosys because it is a global technology company with large-scale enterprise projects, strong learning programs, and opportunities to work with clients across domains. I believe my React and JavaScript skills can contribute to frontend development projects, and Infosys would also help me grow through exposure to real-world systems, teamwork, and continuous learning.

---

## Quick Last-Minute Revision Points

- Explain hooks clearly, especially `useEffect` dependencies and cleanup.
- Know props vs state, controlled vs uncontrolled, and keys in lists.
- Be ready to write small code snippets: counter, API call, custom hook, protected route.
- For performance, mention profiling before optimization.
- For HR answers, connect your project experience to Infosys's enterprise work.

