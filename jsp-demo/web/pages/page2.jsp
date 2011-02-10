<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://granule.com/tags" prefix="g" %>
<html>
  <head><title>This is the second struts page</title>
      <g:compress basepath="ExampleAction.do" method="closure-compiler" options="output_wrapper=%output%">
      <script src="js/closure/goog/base.js"></script>
        <script>
          goog.require('goog.events');
          goog.require('goog.fx');
          goog.require('goog.fx.dom');
        </script>
        <link rel="stylesheet" href="js/closure/goog/demos/css/demo.css">
        <style>
          #test1 {
            position: absolute;
            left: 150px;
            top: 100px;
            width: 20px;
            height: 20px;
            background-color: rgb(0,0,0);
          }

          button {
            font: normal 10px arial;
            width: 125px;
          }
        </style>
        </g:compress>
  </head>
  <body><a href="ExampleAction.do?go=ex3">Go to the third page</a>
  <p><strong>Demonstrations of the goog.fx.dom library</strong></p>

    <p>
      <button id="but0" onclick="slide(0, 0);">Slide To 0x0</button><br>
      <button id="but1" onclick="slide(400, 40);">Slide To 400x40</button><br>

      <button id="but2" onclick="slide(300, 200);">Slide To 300x200</button><br>
      <button id="but3" onclick="slide(600, 100);">Slide To 600x100</button>
    </p>

    <p>
      <button id="but4" onclick="resize(50, 50);">Resize To 50x50</button><br>
      <button id="but5" onclick="resize(250, 50);">Resize To 250x50</button><br>

      <button id="but6" onclick="resize(5, 5);">Resize To 5x5</button><br>
      <button id="but7" onclick="resize(250, 250);">Resize To 250x250</button>
    </p>

    <p>
      <button id="but8" onclick="fadeout();">Fade Out</button><br>
      <button id="but9" onclick="fadein();">Fade In</button>

    </p>

    <p>
      <button id="but10" onclick="color(200, 0, 0);">Transform to red</button><br>
      <button id="but11" onclick="color(180, 180, 180);">Transform to grey</button><br>
      <button id="but12" onclick="color(0, 0, 0);">Transform to black</button><br>
      <button id="but13" onclick="color(100, 100, 255);">Transform to blue</button>

    </p>


    <div id="test1"><!-- This comment is an IE6 hack to fix height:20px --></div>

    <script>
      var col = [0, 0, 0];
      var duration = 1000;

      var el = document.getElementById('test1');

      /**
       * Enables all buttons then disposes of the animation.
       * @param {!goog.events.Event} e goog.fx.Animation.EventType.END event with
       *     the goog.fx.Animation object in its target.
       */
      function enableButtons(e) {
        for (var i = 0; i <= 13; i++) {
          document.getElementById('but' + i).disabled = false;
        }
        e.target.dispose();
      }

      function disableButtons() {
        for (var i = 0; i <= 13; i++) {
          document.getElementById('but' + i).disabled = true;
        }
      }

      function slide(a, b) {
        var x = el.offsetLeft;
        var y = el.offsetTop;
        var anim = new goog.fx.dom.Slide(el, [x, y], [a, b], duration,
            goog.fx.easing.easeOut);
        goog.events.listen(anim, goog.fx.Animation.EventType.BEGIN,
            disableButtons);
        goog.events.listen(anim, goog.fx.Animation.EventType.END, enableButtons);
        anim.play();
      }

      function resize(a, b) {
        var w = el.offsetWidth;
        var h = el.offsetHeight;
        var anim = new goog.fx.dom.Resize(el, [w, h], [a, b], duration,
            goog.fx.easing.easeOut);
        goog.events.listen(anim, goog.fx.Animation.EventType.BEGIN,
            disableButtons);
        goog.events.listen(anim, goog.fx.Animation.EventType.END, enableButtons);
        anim.play();
      }

      function fadeout() {
        var anim = new goog.fx.dom.FadeOutAndHide(el, duration);
        goog.events.listen(anim, goog.fx.Animation.EventType.BEGIN,
            disableButtons);
        goog.events.listen(anim, goog.fx.Animation.EventType.END, enableButtons);
        anim.play();
      }

      function fadein() {
        var anim = new goog.fx.dom.FadeInAndShow(el, duration);
        goog.events.listen(anim, goog.fx.Animation.EventType.BEGIN,
            disableButtons);
        goog.events.listen(anim, goog.fx.Animation.EventType.END, enableButtons);
        anim.play();
      }

      function color(r, g, b) {
        var anim = new goog.fx.dom.BgColorTransform(el, col, [r, g, b], duration);
        goog.events.listen(anim, goog.fx.Animation.EventType.BEGIN,
            disableButtons);
        goog.events.listen(anim, goog.fx.Animation.EventType.END, function(e) {
          col = [e.x, e.y, e.z];
          enableButtons();
        });
        anim.play();
      }

    </script>
  </body>
</html>