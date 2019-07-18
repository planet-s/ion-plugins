<template>
  <div>
    <nuxt/>
  </div>
</template>

<style>
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

.button--green {
  display: inline-block;
  border-radius: 4px;
  border: 1px solid #3b8070;
  text-decoration: none;
  padding: 10px 30px;
  color: #fff;
  background-color: #3b8070;
}
.button--green:hover {
  background: #1d4038;
}
.button--grey {
  display: inline-block;
  border-radius: 4px;
  border: 1px solid white;
  color: white;
  text-decoration: none;
  padding: 10px 30px;
  margin-left: 15px;
}
.button--grey:hover {
  background-color: #fff;
  color: #35495e;
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
