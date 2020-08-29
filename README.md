# Table of Contents

1. [What is Geoffrey](#1)

    1.1. [Install Geoffrey](#11-install-geoffrey)

    1.2. [Basic Usage Quick And Dirty](#12-basic-usage-quick-and-dirty)

2. [Hooks Basics](#2-hooks-basics)

    2.1. [UseHttpServer](#21-usehttpserver)

    2.2. [UseSecureHttpServer](#22-usesecurehttpserver)

    2.3. [UseSecurityContext](#23-usesecuritycontext)

    2.4. [Use < Route >](#24-use-<-route->)

    2.4.1. [UseGet](#24-use-<-route->)

    2.4.2. [UsePut](#24-use-<-route->)

    2.4.3. [UsePatch](#24-use-<-route->)

    2.4.4. [UsePost](#24-use-<-route->)

    2.4.5. [UseDelete](#24-use-<-route->)

    2.4.6. [UseCustom](#24-use-<-route->)

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

Visit localhost:8080/home using the methods **GET**, **POST**.

You can run this example by invoking

    dart ./example/use_http_server.dart

# 2. Hooks Basics

In Geoffrey everything is a hook! There is no need to create objects, extend classes, annotate their properties etc. In general most of Geoffrey's hooks can be used literally anywhere in your code. There are a few exceptions thou we will cover them as we go along with the documentation.

## 2.1. UseHttpServer

The **useHttpServer** does a few things for us. 

* It creates and returns a http server
* Sets the default response headers
* Handles the incoming Requests
* Takes care of the middlewares
* Serves files if a publicDir is provided
* Gzips all the text based contents right out of the box

Here are the params that it takes:

    Future<HttpServer> useHttpServer(
        String host, 
        int port,
    { 
        int backlog = 0,
        bool v60only = false,
        bool shared = false,
        bool autoClose = true
    })

* backlog: Can be used to specify the listen backlog for the underlying OS listen setup
* v60only: Use IPv6 only
* shared: Shares the port with other servers
* autoClose: calls request.response.close() automatically

Example

    HttpServer server = await useHttpServer('localhost', 8080);

## 2.2. UseSecureHttpServer

The **useSecureHttpServer** hook essentially does the same thing the **useHttpServer** hook does. However it comes with one additional required parameter, the security context!

    Future<HttpServer> useSecureHttpServer(
    String host, 
    int port, 
    SecurityContext sctx,
    {...})

The **SecurityContext** is part of the **dart:io** package. You can either use the api or simply invoke the [useSecurityContext](#23-usesecuritycontext) hook to create a security context.

Example

    HttpServer server = await useSecureHttpServer('localhost', 443, sctx);

## 2.3. UseSecurityContext

The **UseSecurityContext** creates a SecurityContext by simply setting the certificate, privateKey and the password. For a more advanced usage we recommend to use the **SecurityContext** from the **dart:io** api.

    SecurityContext useSecurityContext({ 
        @required String cert, 
        @required String pkey, 
        String password 
    })

Example

    SecurityContext sctx = useSecurityContext(cert: 'cert.pem', pkey: 'key.pem');

## 2.4. Use < Route >

All of the route hooks are pretty much identical. Let's take **useGet** as an example.

    useGet(
      route: '/home',
      handleRequest: (req, res) => res.write('hello'),
      handleGuard: (req, res) => true); // optional

The **route** and **handleRequest** parameters are both required. **handleRequest** and **handleGuard** can be async! **handleGuard** is executed before **handleRequest** and must return a boolean. The **useCustom** route hook is slightly different since it takes one additional **method** parameter. You can remove a route by deleting all the methods assotiated to it. To remove a method just use the counterpart hook. For **useGet** the counterpart hook is **useRemoveGet**. Just like **useCustom** the **useRemoveCustom** hook takes one additional **method** parameter.

* useGet / useRemoveGet
* usePut / useRemovePut
* usePatch / useRemovePatch
* usePost / useRemovePost
* useDelete / useRemoveDelete
* useCustom / useRemoveCustom

## 2.5. UsePublicDir

to be continue..