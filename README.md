
# What is Geoffrey?

Geoffrey is a modern open source HTTP framework inspired by JavaScript modules and react-/vueJS hooks. It's focus is low level code abstraction, simplicity, modularity, safety and performance. While Dart has aged well in the last few years it is yet still one of the newer technologies out there. Compared to the other Dart HTTP frameworks Geoffrey is focusing to be more lightweight, customizable and highly modular. In fact Geoffrey is so modular that you can switch the whole server context on the fly! The server context includes all the routing, middleware, file serving information and so on. You can have as many contexts as you want and switch between them as often as you want without shutting down the server. Imagine you have a situation where you want to remove or create a totally new route depending if someone is logged in or even switch the whole Web-Application. Why ever you would want it you can easily achieve it with Geoffrey! 

# Install Geoffrey

Simply add **geoffey** to your pubspec.yaml (**not yet available!!!**)

    dependencies:
        geoffrey: ^1.0.0

Then run **pub get** or if flutter sdk is installed run **flutter pub get** to fetch the dependencies. 

# Hooks Basic Usage

First let's import some hooks.

    import 'package:geoffrey/hooks.dart' 
        show useHttpServer, useGet, usePost;

To create a simple http server all we need to do is call the **useHttpServer** hook. 

    useHttpServer('localhost', 8080);

Then add a route the server should handle and listen to.

    useGet(
      route: '/home',
      handleRequest: (req, res) => res.write('hello'),
      handleGuard: (req, res) => true); // optional

Now let's add the **POST** method to our **/home** route.

    usePost(
      route: '/home',
      handleRequest: (req, res) => res.write('world'));

That's it! If interested checkout the repo and give it a go. 

Visit **localhost:8080/home** using the methods **GET**, **POST**.

You can run this example by invoking

    dart ./example/use_http_server.dart

[Check out the Wiki](https://github.com/ehildt/Geoffrey/wiki/Hooks-Basics)
