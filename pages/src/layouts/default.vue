<template>
  <div>
    <nuxt/>
  </div>
</template>

<style lang="scss">
html {
  font-family: "Source Sans Pro", -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial, sans-serif;
  word-spacing: 1px;
  -ms-text-size-adjust: 100%;
  -webkit-text-size-adjust: 100%;
  -moz-osx-font-smoothing: grayscale;
  -webkit-font-smoothing: antialiased;
  box-sizing: border-box;
  color: white;
}
*, *:before, *:after {
  box-sizing: border-box;
  margin: 0;
}

@media (min-width: 767px) {
  html {
    font-size: 1.5em;
  }
}

.button {
  display: inline-block;
  border-radius: .25em;
  padding: 0 3em;
  color: #fff;
  cursor: pointer;
  height: 3em;
}

@mixin button_color($color, $name) {
  .button--#{$name} {
    @extend .button;
    background-color: $color;

    &:hover {
      background: darken($color, 10%);
    }

    &:active {
      background: darken($color, 15%);
    }
  }
}

@include button_color(#3b8070, green);
@include button_color(#BC5666, red);

code {
    display: inline-block;
    border-radius: .5em;
    padding: .2em .5em;
    margin: .1em 0;
    background: #19232d;
    color: #84909c;
}

code.block {
    display: block;
    border-radius: 1em;
    padding: 1.5em 1em;
    text-align: left;
    margin: 1em;
}
</style>
