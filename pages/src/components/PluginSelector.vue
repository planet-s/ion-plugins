<template lang="pug">
section.faq(ref="rootEl")
  .faq-wrapper
    nav.faq__nav(v-if="hasNavigation")
      div(
        v-for="(category, i) in categories"
        :key="i"
        :class="generateCategoryClasses(i)"
        @click="makeActiveCategory(i)"
      ) {{ category }}

    transition(name="accordion-fade-slide" mode="out-in")
      .accordion(v-if="showAccordion")
        .accordion__item(v-for="(item, i) in categoryItems" :key="i")
          div(:class="generateQuestionClasses(i)" @click="makeActive(i)")
            p.accordion__title-text(v-html="item['title']")
            .buttons
              button.button--green(
                v-if="value.indexOf(item) === -1"
                @click.stop="$emit('update', item)"
              ) Select
              button.button--red(v-else @click.stop="$emit('update', item)") Remove
              button(:class="generateButtonClasses(i)")
          collapse-transition
            div.accordion__value(v-if="i === activeQuestionIndex")
              h2 Description
              p.description(v-html="item.desc")
              .aliases(v-if="Object.entries(item.aliases).length !== 0")
                h2 Aliases
                code.block
                  span(v-for="alias, name in item.aliases") alias {{ name }} = '{{ alias }}'
                    br
              .funcs(v-if="Object.entries(item.funcs).length !== 0")
                h2 Functions
                code.block
                  span(v-for="description, name in item.funcs") fn {{ name }} -- {{ description }}
                    br
              button.button--green(
                v-if="value.indexOf(item) === -1"
                @click.stop="$emit('update', item)"
              ) Select
              button.button--red(v-else @click.stop="$emit('update', item)") Remove
</template>

<script>
// This is taken from https://github.com/gerasimvol/vue-faq-accordion with a modification to allow a custom slot
import { CollapseTransition } from 'vue2-transitions';

export default {
  name: 'VueFaqAccordion',
  components: { CollapseTransition },
  data() {
    return {
      activeTab: 0,
      activeQuestionIndex: null,
      showAccordion: true,
    };
  },
  props: {
    items: {
      type: Array,
      required: true,
    },
    value: {
      type: Array,
      required: true,
    },
  },
  computed: {
    categories() {
      const uniqueCategories = [...new Set(this.items.map(item => item.category))];
      return uniqueCategories;
    },
    categoryItems() {
      return this.items.filter(item => item.category === this.categories[this.activeTab]);
    },
    hasNavigation() {
      return !!this.categories[0];
    },
  },
  methods: {
    makeActive(itemIndex) {
      this.activeQuestionIndex = this.activeQuestionIndex === itemIndex ? null : itemIndex;
    },
    generateButtonClasses(buttonIndex) {
      return [
        'accordion__toggle-button',
        this.activeQuestionIndex === buttonIndex
          ? 'accordion__toggle-button_active'
          : null,
      ];
    },
    generateQuestionClasses(questionIndex) {
      return [
        'accordion__title',
        this.activeQuestionIndex === questionIndex
          ? 'accordion__title_active'
          : null,
      ];
    },
    makeActiveCategory(category) {
      if (this.activeTab === category) return;
      this.showAccordion = false;
      this.activeTab = category;
      this.activeQuestionIndex = null;
      setTimeout(() => {
        this.showAccordion = true;
      }, 300);
    },
    generateCategoryClasses(category) {
      return [
        'faq__nav-item',
        this.activeTab === category
          ? 'faq__nav-item_active'
          : null,
      ];
    },
  },
};
</script>

<style lang="scss">
  $inverse: #de935f;
  $fg: $inverse;
  $activecolor: adjust-hue($inverse, -30);
  $bg: #35495e;
  $bordercolor: lighten($bg, 10%);

  * {
    box-sizing: border-box;
    margin: 0;
    padding: 0;
  }
  button {
    border: none;
    background: none;
    outline: none;
  }
  .faq {
    width: 100%;
    padding: 0 10px;
    &-wrapper {
      max-width: 825px;
      margin: 0 auto;
    }
    &__title {
      text-align: center;
      margin-bottom: 25px;
    }
    &__nav {
      display: flex;
      justify-content: space-between;
      border: 2px solid $bordercolor;
      border-radius: 5px;
      background: $bg;
    }
    &__nav-item {
      height: 3em;
      flex: 1;
      display: flex;
      justify-content: center;
      align-items: center;
      border-right: 2px solid $bordercolor;
      cursor: pointer;
      font-weight: 600;
      transition: all 0.3s;
      text-align: center;
      user-select: none;
      color: $fg;
      &_active {
        color: $activecolor;
      }
      &:hover {
        color: $activecolor;
      }
      &:last-child {
        border-right: none;
      }
    }
    &__accordion {
      min-height: 250px;
    }
  }
  .accordion-fade-slide {
    &-enter-active,
    &-leave-active {
      transition: all 0.3s;
    }
    &-enter {
      transform: translateY(-25px);
      opacity: 0;
    }
    &-leave-to {
      transform: translateY(25px);
      opacity: 0;
    }
  }
  .accordion {
    background: $bg;
    border: 2px solid $bordercolor;
    border-radius: 5px;
    margin-top: 15px;
    &__item {
      border-bottom: 2px solid $bordercolor;
      padding: 25px;
      &:last-child {
        border-bottom: none;
      }
    }
    &__title {
      display: flex;
      justify-content: space-between;
      align-items: center;
      cursor: pointer;
      transition: all 0.3s;
      color: $fg;
      &_active {
        color: $activecolor;
      }
      &:hover {
        color: $activecolor;
        .accordion__toggle-button {
          &::before,
          &::after {
            background: $activecolor;
          }
        }
      }
      &-text {
        margin-right: 10px;
      }
    }
    &__value {
      margin: 25px 0 0;
      border-top: 2px solid $bordercolor;
      padding: 25px 0 0;
      text-align: left;
    }
    &__toggle-button {
      position: relative;
      width: 1.25em;
      height: 1.25em;
      transition: all 0.3s;
      transform-origin: 50% 50%;
      padding-left: 1.25em;
      margin-left: 2em;
      cursor: pointer;
      vertical-align: middle;

      &::before,
      &::after {
        content: '';
        position: absolute;
        left: 0;
        width: 100%;
        height: 2px;
        transition: all 0.3s;
        background: black;
      }
      &::before {
        transform: rotate(90deg);
      }
      &_active {
        transform: rotate(45deg);
        &::before,
        &::after {
          background: $activecolor;
        }
      }
    }
  }

  .description {
    border-left: 5px solid white;
    padding: 2em;
    font-size: 0.75em;
    margin: 1em;
  }
</style>
