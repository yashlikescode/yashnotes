# ANGULAR INTERVIEW QUESTIONS & ANSWERS

## 1. Angular vs React
**Ideal Answer**
| Feature | Angular | React |
|---|---|---|
| Type | Full framework | UI Library |
| Language | TypeScript | JavaScript/TypeScript |
| Data binding | Two-way | One-way |
| State management | Services/NgRx | Redux/Context |
| Learning curve | Steeper | Easier |
| CLI | Angular CLI | Create React App / Vite |
| Performance | Good | Excellent with optimization |

## 2. Angular in your project architecture
**Answer:** In my current project, the frontend is built with Angular and RxJS. It communicates with backend Spring Boot microservices through REST APIs via an API Gateway. We use Angular services with `HttpClient` for API calls, RxJS operators for async handling, and NgRx/component services for state management.

```typescript
@Injectable({ providedIn: 'root' })
export class UserService {
  constructor(private http: HttpClient) {}
  getUsers(): Observable<User[]> {
    return this.http.get<User[]>('/api/users');
  }
}
```

## 3. Explain NgRx
**Answer:** NgRx is a Redux-inspired state management library for Angular. It manages state predictably using **Actions, Reducers, Selectors, and Effects**.
Flow: Component dispatches Action → Reducer updates State → Effects handle async calls → Selectors read state → Component consumes it.

```typescript
// action
export const loadUsers = createAction('[User] Load Users');
export const loadUsersSuccess = createAction('[User] Load Success', props<{ users: User[] }>());

// reducer
export const userReducer = createReducer(
  initialState,
  on(loadUsersSuccess, (state, { users }) => ({ ...state, users }))
);

// effect
@Injectable()
export class UserEffects {
  loadUsers$ = createEffect(() =>
    this.actions$.pipe(
      ofType(loadUsers),
      switchMap(() => this.userService.getUsers().pipe(
        map(users => loadUsersSuccess({ users }))
      ))
    )
  );
  constructor(private actions$: Actions, private userService: UserService) {}
}

// Component
this.store.dispatch(loadUsers());
this.users$ = this.store.select(selectAllUsers);
```

## 4. Subject vs BehaviorSubject (RxJS)
**Ideal Answer**

```typescript
import { Subject, BehaviorSubject } from 'rxjs';

// Subject - no initial value, subscribers only get future emissions
const subject = new Subject<string>();
subject.next('Hello'); // nobody receives this yet
subject.subscribe(val => console.log('Late subscriber:', val));
subject.next('World'); // Late subscriber: World

// BehaviorSubject - stores last value, new subscribers get it immediately
const behavior = new BehaviorSubject<string>('Initial');
behavior.next('Hello');
behavior.subscribe(val => console.log('Subscriber:', val)); // Subscriber: Hello (gets current)
behavior.next('World'); // Subscriber: World
```

## 5. RxJS switchMap
**Ideal Answer**

```typescript
// switchMap - cancels previous, switches to new observable
// Perfect for search - only care about latest result

this.searchControl.valueChanges.pipe(
    debounceTime(300),         // wait 300ms
    distinctUntilChanged(),    // only if value changed
    switchMap(term =>          // cancel previous, make new request
        this.userService.search(term)
    )
).subscribe(results => this.results = results);

// mergeMap - doesn't cancel, handles all concurrently
// concatMap - queues, executes in order
// exhaustMap - ignores new until current completes (login button)
```

## 6. Promise vs Observable
**Answer:** A Promise resolves once with a single value. An Observable can emit multiple values over time, is cancellable, and supports operators like `map`, `filter`, `switchMap`.

## 7. Parent-Child component communication
**Answer:** Parent → Child: `@Input()`. Child → Parent: `@Output()` with `EventEmitter`. Direct access: `@ViewChild`.

```typescript
// child
export class ChildComponent {
  @Input() data!: string;
  @Output() notify = new EventEmitter<string>();
  send() { this.notify.emit('Hello Parent'); }
}
```

```html
<app-child [data]="parentData" (notify)="onNotify($event)"></app-child>
```

## 8. Angular Lifecycle Hooks
**Answer:** `ngOnInit` (after first input binding), `ngOnChanges` (on input change), `ngDoCheck`, `ngAfterViewInit`, `ngOnDestroy` (cleanup/unsubscribe).

## 9. HTTP Interceptor
**Answer:** Interceptors intercept HTTP requests/responses — commonly used to attach JWT tokens, logging, or global error handling.

```typescript
@Injectable()
export class AuthInterceptor implements HttpInterceptor {
  intercept(req: HttpRequest<any>, next: HttpHandler) {
    const token = localStorage.getItem('token');
    const cloned = req.clone({ setHeaders: { Authorization: `Bearer ${token}` } });
    return next.handle(cloned);
  }
}
```

## 10. Reactive vs Template-driven Forms
**Answer:** Template-driven forms are defined in HTML using `ngModel` — good for simple forms. Reactive forms are defined in the component using `FormGroup`/`FormControl` — better for complex validation and testability.

```typescript
this.form = new FormGroup({
  email: new FormControl('', [Validators.required, Validators.email])
});
```