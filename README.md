# Geoffrey

Geoffrey is a modern http framework inspired by JavaScript modules and react-/vueJS hooks. 
It's focus is low level code abstraction, simplicity, modular approach, safety and performance.

## Why Geoffrey?

While Dart has aged well in the last few years it is yet still one of the newer technologies out there.
Compared to the other Dart http frameworks Geoffrey is focusing to be more lightweight, straight forward, elegant and simple to use.

## Install Geoffrey

Simply add **geoffey:version** to your pubspec.yaml (**not yet available!!!**)
Then run **pub get** or if flutter sdk is installed run **flutter pub get**.

## Recommended VSCode Extensions

While you don't need any additional tools or plugins to work with Geoffrey, 
we still want to give you some awesome extensions on your hands that help you code.

* Dart (Official VSCode plugin for Dart)
* Bracket Pair Colorizer 2
* intent-rainbow
* GitLense
* YAML
* Make Hide

# Basic Usage

 
In Geoffrey everything is a hook. There is no need to create objects, extend classes and annotate their properties etc. In general most of Geoffrey's hooks can be used literally anywhere in your code! We will cover the few exceptions at a later time. To create a simple http server all we need to do is use the **useHttpServer** hook.

    useHttpServer('localhost', 8080);

Then add a route the server should handle and listen to.

    useGet(
      route: '/home',
      handleRequest: (req, res) => res.write('hallo'),
      handleGuard: (req, res) => true); // optional

In the code snipped above, just like the hook identifier implies, **useGet** will create a new route **/home** with the **GET** method. Re-using **useGet** with the same route identifier will override the **GET** method for this particular route. **handleGuard** is optional and if provided **must!** return a boolean. If **handleGuard** returns **false** the server won't execute **handleRequest** and responds with HTTP Status Code 422 - unprocessable Entity. If **handleGuard** is provided it executes before **handleRequest** and thus guards the route from unauthorized access. Now let's add the **POST** method to our **/home** route.
  

    usePost(
      route: '/home',
      handleRequest: (req, res) => res.write('world'));

Notice how we provide the same route identifier to **usePost**. Since the route **/home** already exists only the **POST** method is being added. Now the server handles both methods **GET** and **POST** on route **/home**.
Also worth noticing is that we omit the optional **handleGuard** on **usePost**. Now let's add one last custom method to route **/home** by using the **useCustom** hook.

    useCustom(
      route: '/home',
      method: 'x-magic-rabbit',
      handleGuard: (req, res) => false,
      handleRequest: (req, res) => res.write('a wild magic rabbit appeared!'));

The **useCustom** hook enables the developer to add a custom **method**. It behaves the very same way **useGET** and **usePost** do. The difference is that we need to provide one more argument called **method**. By convention all HTTP method identifiers are capitalized. We can provide the **method** argument all in lowercase. It will be capitalized in the background for us. Also just like the convention with setting custom headers it is a good practise to append the custom method identifiers with a **x-** prefix just like in our example **x-magic-rabbit**. Please pay attention to **handleGuard** and it's return value. Since it returns **false** we will receive the HTTP Status 422 when trying to route to **/home** with the custom method **X-MAGIC-RABBIT**.

That's it! Now run the server and visit http://localhost:8080/home by using the methods **GET**, **POST** and **X-MAGIC-RABBIT**! For this just check out the repo and run:

> dart ./example/basic_usage.dart

..to be continue
