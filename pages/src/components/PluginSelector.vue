<template lang="pug">
  vue-faq-accordion(:items="items" border-color="#35495e" active-color="#921827")
    template(v-slot:default="props")
      p(v-html="props.item.desc")
      .aliases(v-if="Object.entries(props.item.aliases).length !== 0")
        h2 Aliases
        code.block
          span(v-for="alias, name in props.item.aliases") alias {{ name }} = '{{ alias }}'
            br
      .funcs(v-if="Object.entries(props.item.funcs).length !== 0")
        h2 Functions
        code.block
          span(v-for="description, name in props.item.funcs") fn {{ name }} -- {{ description }}
            br
      button.button--green(@click="$emit('update', props.item)") Add
</template>

<script>
import VueFaqAccordion from './Selector.vue';

export default {
  components: { VueFaqAccordion },
  props: {
    items: {
      type: Array,
      required: true,
    },
  },
};
</script>

<style>
.button--green {
  margin: 1em;
}
</style>
