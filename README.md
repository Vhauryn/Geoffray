# Table of Contents

1. [What is Geoffrey](#1)

    1.1. [Install Geoffrey](#11-install-geoffrey)

    1.2. [Basic Usage Quick And Dirty](#12-basic-usage-quick-and-dirty)

2. [Hooks Dokumentation](#2-hooks-documentation)

    2.1. [UseHttpServer](#21-usehttpserver)
    
    2.2. [UseSecureHttpServer](#22-usesecurehttpserver)


# 1. What is Geoffrey?

Geoffrey is a modern open source HTTP framework inspired by JavaScript modules and react-/vueJS hooks. It's focus is low level code abstraction, simplicity, modularity, safety and performance. While Dart has aged well in the last few years it is yet still one of the newer technologies out there. Compared to the other Dart HTTP frameworks Geoffrey is focusing to be more lightweight, customizable and highly modular. In fact Geoffrey is so modular that you can switch the whole server context on the fly! The server context includes all the routing, middleware, file serving information and so on. You can have as many contexts as you want and switch between them as often as you want without shutting down the server. Imagine you have a situation where you want to remove or create a totally new route depending if someone is logged in or even switch the whole Web-Application. Why ever you would want it you can easily achieve it with Geoffrey! 

## 1.1. Install Geoffrey

Simply add **geoffey** to your pubspec.yaml (**not yet available!!!**)

    dependencies:
        geoffrey: ^1.0.0

Then run **pub get** or if flutter sdk is installed run **flutter pub get** to fetch the dependencies. 


## 1.2. Basic Usage Quick And Dirty

First let's import some hooks.

    import 'package:geoffrey/hooks.dart' 
        show useHttpServer, useGet, usePost, useCustom;

To create a simple http server all we need to do is call the **useHttpServer** hook. 

    useHttpServer('localhost', 8080);

Then add a route the server should handle and listen to.

    useGet(
      route: '/home',
      handleRequest: (req, res) => res.write('hello'),
      handleGuard: (req, res) async => await Future.delayed(
            Duration(seconds: 2),
            () => true,
          )); // optional

Now let's add the **POST** method to our **/home** route.
  

    usePost(
      route: '/home',
      handleRequest: (req, res) => res.write('world'));

Let's add one last custom method to route **/home** by using the **useCustom** hook.

    useCustom(
      route: '/home',
      method: 'x-magic-rabbit',
      handleGuard: (req, res) => true,
      handleRequest: (req, res) => res.write('a wild magic rabbit appeared!'));


That's it! If interested checkout the repo and give it a go. 

You can run this example by invoking

    dart ./example/use_http_server.dart

Visit localhost:8080/home using the methods **GET**, **POST** and **X-MAGIC-RABBIT**! 

# 2. Hooks Documentation

## 2.1. UseHttpServer

## 2.2. UseSecureHttpServer
