      //...
<template>
  <div class="row">
    <div class="col-2">
    </div>

    <div class="col-6">
      <h5>Pipelines are processed in order from top to bottom</h5>
      <draggable
        class="list-group"
        tag="ul"
        v-model="list"
        v-bind="dragOptions"
        @start="isDragging = true"
        @end="isDragging = false">
        <transition-group type="transition" name="flip-list">
          <li
            class="list-group-item"
            v-for="element in list"
            :key="element.order">
            <i :class=" element.fixed ? 'fa fa-anchor' : 'glyphicon glyphicon-pushpin' "
              @click="element.fixed = !element.fixed"
              aria-hidden="true"></i>
            {{ element.name }}
          </li>
        </transition-group>
      </draggable>
    </div>

    <rawDisplayer class="col-3" :value="list" title="List" />
  </div>
</template>

<script>
import draggable from "vuedraggable"
import axios from 'axios'

export default {
  name: "transition-example",
  display: "Transition",
  order: 6,
  components: {
    draggable
  },
  data() {
    return {
      items: []
    };
  },
  computed: {
    list() {
      return this.items.map((item, index) => {
        return {name: item.name, order: item.position}
      })
    },
    dragOptions() {
      return {
        animation: 0,
        group: "description",
        disabled: false,
        ghostClass: "ghost"
      };
    }
  },
  props: {
    rowData: {
      type: Object,
      required: true
    },
    rowIndex: {
      type: Number
    }
  }, 
  mounted() {
    axios.get(`pipelines/${this.rowData.id}.json`).then((response) => {
      this.items = [...this.items, ...response.data.data]
    }).catch(function (error) {
      console.log(error);
    }).finally(function () {
        // always executed
    })
  }
};
</script>

<style>
.button {
  margin-top: 35px;
}

.flip-list-move {
  transition: transform 0.5s;
}

.no-move {
  transition: transform 0s;
}

.ghost {
  opacity: 0.5;
  background: #c8ebfb;
}

.list-group {
  min-height: 20px;
}

.list-group-item {
  cursor: move;
}

.list-group-item i {
  cursor: pointer;
}
</style>