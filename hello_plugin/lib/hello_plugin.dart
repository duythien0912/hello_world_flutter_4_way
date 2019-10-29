library hello_plugin;

/// A HelloWorldPlugin.
class HelloPlugin {
  /// Returns [Hello World $name].
  String hello([String name]) => "Hello World${name != null ? " $name" : ""}";
}
