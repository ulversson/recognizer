import { WeElement, h } from "omi";
import axios from "axios";
export default class _class extends WeElement {
  render(props) {
    return h(
      "div",
      null,
      h(
        "div",
        {
          class: "col-lg-12"
        },
        h("router-view", null)
      )
    );
  }

  data() {
    return {};
  }
}
_class.css = ``;
