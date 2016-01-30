## elm-html touch event issue

I re-used the counter example from the elm architecture tutorial to show the issue. But instead of using ```onClick``` listeners, I used  ```on``` custom event listeners.
The custom event listener works on "click" events but not on "touchend" events, whereas it should work in both cases.

In this example:
- The '-' button listens to "click" events.
- The '+' button listens to "touchend" events.

To reproduce:
1. Clone the repo
2. Launch ```elm-reactor```
3. Use google chrome dev tools to emulate touch events in your browser

As you can see the '+' button doesn't work, whereas the '-' button works perfectly.

NOTE:
The json decoder used with the custom listeners  ```on```, tries to decode the attribute 'altKeys' from the javascript event object, just because this attribute is present on both touch events and mouse events.
