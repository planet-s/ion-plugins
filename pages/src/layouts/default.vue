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

$button: #3b8070;
.button--green {
  display: inline-block;
  border-radius: 4px;
  border: 1px solid #3b8070;
  text-decoration: none;
  padding: 10px 30px;
  color: #fff;
  background-color: $button;
  cursor: pointer;

  &:hover {
    background: darken($button, 10%);
  }

  &:active {
    background: darken($button, 15%);
  }
}
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
