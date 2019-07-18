<template lang="pug">
  vue-faq-accordion(:items="items" border-color="#35495e" active-color="#921827")
    template(v-slot:default="props")
      code.block {{ props.item.content }}
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
