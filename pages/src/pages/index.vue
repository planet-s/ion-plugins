<template lang="pug">
section.container
  h1 Ion Plugins
  .explanations
    ol
      li Install Ion
        li Run&nbsp;
          code git clone https://gitlab.redox-os.org/redox-os/ion-plugins ~/.config/ion/plugins
          li Scroll down and select the plugins you want
          li Copy and paste this in ~/.config/ion/initrc&ensp;
            strong (Will auto-update with your choices)
            pre
              code.block {{ initrc }}
  .selection
    plugin-selector(:items="items" @update="toggle(`${$event.category}/${event.title}.ion`)")
</template>

<script>
import items from '~/static/data.json';
import PluginSelector from '~/components/PluginSelector.vue';

export default {
  components: { PluginSelector },
  data() {
    return {
      items,
      selection: [],
    };
  },
  computed: {
    initrc() {
      let initrc = 'source ~/.config/ion/plugins/init.ion';
      if (this.selection.length !== 0) {
        initrc += '\n\n# Your list of plugins';
      }
      return [...this.selection].reduce((rest, item) => `${rest}\nsource ~/.config/ion/plugins/${item}`, initrc);
    },
  },
  methods: {
    toggle(item) {
      const index = this.selection.indexOf(item);

      if (index === -1) {
        this.selection.push(item);
      } else {
        this.selection.splice(index, 1);
      }
    },
  },
};
</script>

<style lang="scss">
$bg: #35495e;
$inverse: #de935f;

.container {
  min-height: 100vh;
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  background-color: $bg;
  flex-flow: column;
}

.explanations {
  min-height: 40vh;
  margin: 0 2vw 0;

  ol {
    padding-left: 0;
    list-style-type: none;
    counter-reset: item;
  }

  li {
    margin: 1em;

    &:before {
      content: counter(item) " – ";
      counter-increment: item;
      display: marker;
      width: 2em;
      color: rgba(255,255,255,0.6);
      font-style: italic;
    }
  }
}

.selection {
  background-color: $inverse;
  min-height: calc(100vh + 60px);
  min-width: 100vw;
  padding-top: 20vh;
  position: relative;

  &:after {
    top: -60px;
    left: 50%;
    border: solid transparent;
    content: " ";
    height: 0;
    width: 0;
    position: absolute;
    pointer-events: none;
    border-top-color: $bg;
    border-width: 100px;
    margin-left: -100px;
    transform: scaleY(0.4)
  }
}

.small {
  font-weight: 100;
  font-size: .75em;
}

h1 {
  font-family: Roboto, "Helvetica Neue", Arial, sans-serif; /* 1 */
  display: block;
  font-weight: 100;
  color: white;
  letter-spacing: 1px;
  margin: 0.5em 0.5em;
}

@media (min-height: 767px) {
  h1 {
    margin: 20vh 0 0;
    font-size: 3em;
  }

  .explanations {
    height: 50vh;
    margin: 10vh 10vw 0;
  }
}
</style>
