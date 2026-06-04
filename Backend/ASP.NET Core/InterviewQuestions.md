## ASP.NET Core Interview Answers

- **What is Asp.Net Core?**  
  ASP.NET Core is a modern, cross-platform, open-source framework for building web apps, APIs, and microservices on .NET.  
  It is designed for high performance, modularity, and cloud deployment.

- **What are the features of Asp.Net Core?**  
  It supports cross-platform hosting, built-in dependency injection, middleware pipeline, high performance, and unified MVC/Web API/Razor Pages.  
  It also has configuration providers, environment-based startup, and minimal API support.

- **What are the advantages of ASP.NET Core over ASP.NET (.NET Framework)?**  
  ASP.NET Core is cross-platform, lightweight, faster, and supports side-by-side runtime versions.  
  It also has a modular architecture, built-in DI, and improved hosting flexibility.

- **What is Asp.Net Core meta package?**  
  The meta package is `Microsoft.AspNetCore.App`, which bundles common ASP.NET Core libraries and runtime features.  
  It simplifies package management by providing a curated set of framework dependencies.

- **When do you choose classic ASP.NET MVC over ASP.NET Core?**  
  Only if you have an existing legacy application that cannot be migrated easily or depends on Windows-only APIs.  
  For new projects, ASP.NET Core is generally the better choice.

- **What is a web application framework, and what are its benefits?**  
  It is a reusable set of libraries and patterns for building web applications faster and more consistently.  
  Benefits include abstraction of HTTP details, routing, middleware, security, and productivity.

- **What is Kestrel and what are advantages of Kestrel in Asp.Net Core?**  
  Kestrel is the default cross-platform web server for ASP.NET Core.  
  It is lightweight, high-performance, and can be used directly or behind a reverse proxy.

- **What is the difference between IIS and Kestrel? Why do we need two web servers?**  
  IIS is a full-featured Windows web server, while Kestrel is a lightweight cross-platform server.  
  IIS is often used as a reverse proxy for security, process management, and Windows integration.

- **What is the purpose of launchSettings.json in asp.net core?**  
  It stores environment settings, profiles, and launch options for local development.  
  Visual Studio and `dotnet run` use it to configure environment variables, URLs, and the selected profile.

- **What is generic host or HostBuilder in .NET Core?**  
  The generic host is the runtime container for apps, providing dependency injection, configuration, and logging.  
  `HostBuilder` is the API used to configure and build that host for web and non-web apps.

- **What is the purpose of the .csproj file?**  
  It defines the project structure, SDK, package references, build settings, and target framework.  
  It controls compilation, dependencies, and project metadata.

- **What is IIS?**  
  IIS is Internet Information Services, a Windows web server for hosting web applications and services.  
  It manages HTTP requests, process activation, security, and application pools.

- **What is the “Startup” class in ASP.NET core prior to Asp.Net Core 6?**  
  It configures services in `ConfigureServices` and the request pipeline in `Configure`.  
  It is the entry point for app startup logic before minimal hosting was introduced.

- **What does WebApplication.CreateBuilder() do?**  
  It initializes the host builder, configures app settings, logging, DI, and web server defaults.  
  It returns a builder used to register services and middleware before building the app.

- **What is HTTP?**  
  HTTP is the Hypertext Transfer Protocol for client-server communication on the web.  
  It defines request methods, response codes, headers, and payload formats.

- **What is the format of a Request Message?**  
  A request message has a request line, headers, blank line, and optional body.  
  Example: `GET /resource HTTP/1.1`, followed by headers and body.

- **What are the important HTTP methods (or HTTP verbs) – (GET, POST, PUT, PATCH, HEAD, DELETE)?**  
  GET retrieves resources, POST creates resources, PUT replaces resources, PATCH updates partially, HEAD retrieves headers only, and DELETE removes resources.  
  Each verb signals intent and impacts idempotency and caching.

- **What are the important HTTP status codes?**  
  200 means success, 201 created, 302 redirect, 400 bad request, 401 unauthorized, 403 forbidden, 404 not found, 500 server error.  
  They communicate request results to clients.

- **What is Content Negotiation in HTTP?**  
  It is the process of selecting the best response format based on client headers like `Accept`.  
  ASP.NET Core uses it to choose JSON, XML, or custom media types automatically.

- **Explain how HTTP protocol works?**  
  A client sends a request to a server, the server processes it, and returns a response with status, headers, and body.  
  Connections can be keep-alive, and requests are stateless unless the app maintains state.

- **What is a web server?**  
  A web server listens for HTTP requests and dispatches responses from web applications or static content.  
  It manages sockets, protocol details, and often provides security and load balancing.

- **What is middleware?**  
  Middleware are reusable components that inspect, modify, or short-circuit HTTP requests and responses.  
  They form the ASP.NET Core request pipeline.

- **What is the difference between IApplicationBuilder.Use() and IApplicationBuilder.Run()?**  
  `Use()` adds middleware that can call the next component in the pipeline.  
  `Run()` adds terminal middleware that handles the request and stops further processing.

- **What is the use of the "Map" extension while adding middleware to the ASP.NET Core pipeline?**  
  `Map()` branches the pipeline based on request path or predicate.  
  It allows different middleware sequences for different URL prefixes.

- **How do you create a custom middleware?**  
  Implement a class with a constructor accepting `RequestDelegate` and an `Invoke`/`InvokeAsync` method.  
  Register it with `app.UseMiddleware<YourMiddleware>()` or an extension method.

- **What is the right order of middleware used in production-level applications?**  
  Static files and routing first, authentication/authorization before endpoints, error handling near the top, and endpoint execution last.  
  Order matters because middleware executes sequentially.

- **What is Routing?**  
  Routing maps incoming URLs to application endpoints such as controllers, actions, or Razor pages.  
  It decouples URL structure from implementation.

- **How Routing works in ASP.NET Core?**  
  Endpoint routing builds route tables during startup and matches incoming requests to endpoints at runtime.  
  Matched route values are bound to controllers, actions, and parameters.

- **What are the important route constraints?**  
  Constraints include `int`, `bool`, `datetime`, `alpha`, `regex`, and custom constraints.  
  They validate route parameter formats and control matching.

- **What is the purpose of the wwwroot folder?**  
  It is the web root for serving static files like CSS, JavaScript, images, and fonts.  
  Files there are publicly accessible by default.

- **How do you change the path of wwwroot folder?**  
  Configure `WebHostBuilder.UseWebRoot("path")` or set `contentRoot`/`webRoot` in `CreateHostBuilder`.  
  This redirects static file serving to a different directory.

- **What is Controller?**  
  A controller is a class that handles HTTP requests and returns responses in MVC or API apps.  
  It contains action methods and orchestrates data, views, and business logic.

- **What is an Action Method?**  
  It is a public method on a controller that responds to an HTTP request.  
  It returns an `IActionResult`, object, or task representing the response.

- **Explain different types of Action Results in asp.net core?**  
  Types include `ViewResult`, `JsonResult`, `RedirectResult`, `StatusCodeResult`, `FileResult`, and `ObjectResult`.  
  They encapsulate different response behaviors like rendering views, returning JSON, or issuing redirects.

- **What’s the HttpContext object? How can you access it within a Controller?**  
  `HttpContext` encapsulates request, response, user, session, and items for the current HTTP call.  
  In a controller, use the `HttpContext` property inherited from `ControllerBase`.

- **What is model binding in ASP.NET CORE?**  
  Model binding maps request data from query strings, form fields, route values, and headers to action parameters.  
  It simplifies extracting typed input from HTTP requests.

- **How validation works in ASP.NET CORE MVC and how they follow DRY principle?**  
  Validation uses data annotations or custom validators to enforce rules on models.  
  It keeps validation logic in one place and reuses it across model binding, views, and APIs.

- **Explain how dependency injection works in ASP.NET Core?**  
  ASP.NET Core has built-in DI where services are registered in `ConfigureServices` and injected via constructors.  
  The framework resolves dependencies at runtime using a service provider.

- **“ASP.NET Core has dependency injection to manage services; are you aware of the different lifetimes? What are they, and what does each mean?”**  
  Lifetimes are `Singleton` (one instance app-wide), `Scoped` (one instance per request), and `Transient` (new instance each resolve).  
  Choose based on state, thread safety, and resource usage.

- **What are the benefits of Dependency Injection?**  
  DI improves testability, decouples components, and centralizes dependency management.  
  It also makes configuration and lifetime control easier.

- **What is IoC (DI) Container?**  
  It is the runtime service provider that manages object creation and dependency resolution.  
  It stores service registrations and builds object graphs on demand.

- **What is Inversion of Control?**  
  IoC means giving the framework control over object creation and dependency wiring instead of hardcoding it.  
  It reverses responsibility from callers to a container.

- **How do you create your own scopes in asp.net core?**  
  Use `IServiceScopeFactory.CreateScope()` to create a manual scope.  
  Resolve services from the new scope and dispose it when finished.

- **How do you inject a service in view?**  
  Use `@inject MyService MyServiceInstance` in Razor views.  
  Or register view components and inject via constructor in view component classes.

- **Why you prefer Autofac over built-in Microsoft DI?**  
  Autofac offers advanced features like property injection, module support, and rich lifetime scopes.  
  Built-in DI is simpler and usually enough for most apps.

- **What exception do you get when a specific service that you injected, can’t be found in the IoC container?**  
  You get an `InvalidOperationException` during service resolution or app startup.  
  The message indicates the requested service type is not registered.

- **What is the purpose of the appsettings.json file?**  
  It stores configuration values like connection strings, logging, and app settings.  
  It is loaded by the configuration system at startup.

- **You have configuration values needed to access your application resources. Which configuration providers do you prefer for development, and which do you prefer for production?**  
  Use `appsettings.Development.json`, environment variables, and user secrets for development.  
  Use `appsettings.Production.json`, environment variables, and secure vaults for production.

- **How do you use Options pattern in Asp.Net Core?**  
  Bind configuration sections to typed classes with `services.Configure<T>(configuration)`.  
  Inject `IOptions<T>` or `IOptionsSnapshot<T>` into services.

- **How do you enable Secrets manager and why?**  
  Use `dotnet user-secrets init` and store sensitive values locally outside source control.  
  It keeps secrets like API keys and connection strings safe during development.

- **Tell some brief about Unit testing?**  
  Unit testing verifies small code units independently using automated tests.  
  It ensures correctness, catches regressions, and supports refactoring.

- **Who can perform Unit Testing?**  
  Developers or QA engineers can write unit tests as part of development.  
  It is typically done by developers close to the implementation.

- **What is TDD?**  
  Test-driven development is a workflow where you write tests before production code.  
  It cycles through failing test, implementation, and refactor stages.

- **Explain how attribute-based routing works?**  
  Routes are defined using attributes like `[Route]`, `[HttpGet]`, and `[HttpPost]` on controllers/actions.  
  The framework matches requests to endpoints based on those attributes.

- **“You can map routes to endpoints explicitly (attribute routing) or through convention (convention routing); which do you prefer and why?”**  
  Attribute routing is preferred for clarity and API control because it keeps routes close to actions.  
  Convention routing is useful for consistent, simple route patterns in MVC apps.

- **“You have a page with a form, but when you submit, nothing occurs. How would you go about debugging the issue?”**  
  Check browser console/network for JavaScript errors, verify form action/method, and ensure the endpoint exists.  
  Confirm model binding, anti-forgery tokens, and route configuration are correct.

- **How do you implement buffering and streaming file uploading files into asp.net core app?**  
  Use `IFormFile` for buffered uploads and `Request.Body`/streaming APIs for large file streaming.  
  Configure `FormOptions` and `Stream.CopyToAsync` to avoid memory pressure.

- **What is the difference between ViewModel and DTO?**  
  A ViewModel is tailored to UI needs and may combine multiple models for presentation.  
  A DTO carries data between layers or over the wire without UI-specific behavior.

- **Explain tag helpers**  
  Tag helpers are Razor elements that generate HTML and integrate server-side logic in views.  
  They improve readability and replace HTML helpers with markup-friendly syntax.

- **What is Entity Framework?**  
  EF is an ORM that maps .NET classes to database tables and simplifies data access.  
  It supports LINQ queries, change tracking, migrations, and database providers.

- **“What other libraries or frameworks might you use with ASP.NET Core to build your application, and for what purposes?”**  
  Use AutoMapper for model mapping, Serilog for logging, FluentValidation for validation, and Swagger for API docs.  
  Add EF Core for data access, Identity for auth, and MediatR for CQRS patterns.

- **What is SQL injection attack?**  
  It is when attacker input is executed as SQL, allowing data theft or manipulation.  
  It occurs when queries are built using untrusted concatenated strings.

- **How to handle SQL injection attacks in Entity Framework?**  
  Use parameterized LINQ queries and avoid raw SQL with string concatenation.  
  If using raw SQL, pass parameters through `FromSqlRaw`/`ExecuteSqlRaw` with placeholders.

- **What are POCO classes?**  
  POCOs are plain CLR objects without framework-specific inheritance or attributes.  
  They represent entities in EF without coupling to EF APIs.

- **What is the proxy object?**  
  EF proxy objects are dynamically generated subclasses that enable lazy loading and change tracking.  
  They intercept property access to load related data on demand.

- **What are the various Entity States in EF?**  
  States include `Added`, `Modified`, `Deleted`, `Unchanged`, and `Detached`.  
  EF uses them to determine database operations during `SaveChanges()`.

- **What are various approaches in Code First for model designing?**  
  Use data annotations, Fluent API, or conventions to define entity structure and relationships.  
  Conventions are default rules, annotations add metadata, and Fluent API provides advanced configuration.

- **What C# Datatype is mapped with which Datatype in SQL Server?**  
  `string` maps to `nvarchar`, `int` to `int`, `bool` to `bit`, `DateTime` to `datetime2`, `decimal` to `decimal`.  
  EF Core provider maps CLR types to provider-specific SQL types automatically.

- **What is Code First Migrations in Entity Framework?**  
  Migrations track schema changes and update the database to match the model.  
  They generate SQL scripts and apply schema evolution safely.

- **What is Migrations History Table?**  
  It is a table that stores applied migration identifiers and metadata.  
  EF uses it to know which migrations have already been executed.

- **How you apply code first migrations through code in EF Core?**  
  Call `context.Database.Migrate()` at startup or during deployment.  
  This applies pending migrations automatically.

- **Name some Unit Testing benefits for developers that you personally experienced?**  
  Unit tests catch regressions early and make refactoring safer.  
  They also clarify requirements and improve code design.

- **What is Mocking?**  
  Mocking creates fake implementations of dependencies for isolated testing.  
  It allows testing logic without invoking external systems.

- **What is the difference between Unit Tests and Functional Tests?**  
  Unit tests validate small isolated components, while functional tests verify end-to-end behavior.  
  Unit tests are fast and narrow; functional tests cover workflows and integration.

- **How to unit test an object with database queries?**  
  Abstract the database behind interfaces, then use mocks or in-memory providers for tests.  
  Avoid hitting a real database in pure unit tests.

- **Should unit tests be written for Getter and Setters?**  
  Generally no, unless they contain custom logic or validation.  
  Simple auto-properties do not need explicit tests.

- **How would you unit test private methods?**  
  Test them indirectly through the public behavior that uses them.  
  Private methods are implementation details and should be covered by public API tests.

- **Is writing Unit Tests worth it for already exciting functionality?**  
  Yes, tests protect existing behavior and prevent regressions as code evolves.  
  They add confidence and make future changes safer.

- **What is Code Coverage?**  
  It measures how much code is exercised by tests, usually as a percentage.  
  High coverage helps identify untested paths but is not the same as correctness.

- **When and where should I use Mocking?**  
  Use mocking for external dependencies like databases, web services, or file systems.  
  It is appropriate in unit tests when isolation is required.

- **Explain how and why to use repository pattern in Asp.Net Core?**  
  The repository pattern abstracts data access behind interfaces and decouples business logic.  
  It makes testing easier and hides ORM implementation details.

- **How does EF Core support Transactions?**  
  EF Core automatically wraps `SaveChanges()` in a transaction for single-context operations.  
  You can also use `BeginTransaction()`, `Commit()`, and `Rollback()` for manual control.

- **How do you execute plain SQL in Entity Framework Core?**  
  Use `context.Database.ExecuteSqlRaw()` for commands or `context.Entities.FromSqlRaw()` for queries.  
  Always parameterize inputs to avoid SQL injection.

- **Explain how logging works in Asp.Net Core?**  
  ASP.NET Core uses `ILogger` and a logging pipeline configured in DI with providers like Console or Serilog.  
  Logs are produced by categories and levels, and the framework includes built-in logging support.

- **What is Serilog and why to use it?**  
  Serilog is a structured logging library for .NET that writes log events to sinks like files and databases.  
  It is used for rich, queryable logs and flexible output formatting.

- **What is IDiagnosticContext in Serilog and how to use it?**  
  `IDiagnosticContext` lets you enrich log events with request-specific data in middleware.  
  It is often used in `UseSerilogRequestLogging()` to capture route, query, and response details.

- **Explain different types of filters**  
  Filters include authorization, resource, action, exception, and result filters.  
  They run at different stages of request processing to control security, execution, and responses.

- **Explain request processing pipeline [or] filter pipeline in asp.net core?**  
  The pipeline starts with middleware, then routing, then filters, then action execution and result generation.  
  Each stage can inspect or modify the request/response.

- **How cookies work in asp.net core?**  
  Cookies are sent in the response `Set-Cookie` header and returned in subsequent request `Cookie` headers.  
  ASP.NET Core provides `Request.Cookies` and `Response.Cookies` APIs for reading and writing cookies.

- **How do you short circuit the request in an action filter?**  
  Set `context.Result` to an `IActionResult` in `OnActionExecuting`.  
  That prevents the action from running and returns the result immediately.

- **How do you use dependency injection in action filter?**  
  Implement `IAsyncActionFilter` and register the filter with DI or use `TypeFilterAttribute`/`ServiceFilterAttribute`.  
  The framework resolves filter dependencies from the service container.

- **How do you override order of filters?**  
  Set the `Order` property on filter attributes or instances.  
  Lower values execute earlier in the pipeline.

- **How will you add global filters?**  
  Register them in `services.AddControllers(options => options.Filters.Add(new MyFilter()))`.  
  They apply to all controllers and actions.

- **How do you handle errors in asp.net core application?**  
  Use exception handling middleware like `UseExceptionHandler` or `UseDeveloperExceptionPage` in development.  
  Also add logging, validation, and custom error responses.

- **How do you choose between Exception Middleware and Exception filter?**  
  Use middleware for global error handling across the entire pipeline, including non-MVC requests.  
  Use exception filters when you need MVC-specific exception handling for controllers and actions.