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
        h(
          "div",
          {
            class: "card position-relative"
          },
          h(
            "div",
            {
              class: "card-header py-3"
            },
            h("h6", {
              class: "m-0 font-weight-bold text-primary"
            })
          ),
          h(
            "div",
            {
              class: "card-body"
            },
            "Select menu action on the left"
          )
        )
      )
    );
  }

  data() {
    return {};
  }
}
_class.css = ``;
