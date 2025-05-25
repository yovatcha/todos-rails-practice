import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="quest"
export default class extends Controller {
  static targets = ["name"];

  connect() {
    // Initialize the controller
  }

  toggle(event) {
    event.preventDefault();
    const checked = event.target.checked;
    const questId = this.element.dataset.questId;
    console.log("Quest controller initialized");

    // Send AJAX request to update quest status
    fetch(`/quests/${questId}`, {
      method: "PATCH",
      headers: {
        "Content-Type": "application/json",
        Accept: "application/json",
        "X-CSRF-Token": document.querySelector("meta[name='csrf-token']")
          .content,
      },
      body: JSON.stringify({
        quest: { status: checked },
      }),
    })
      .then((response) => response.json())
      .then((data) => {
        if (data.status === "ok") {
          // Toggle strikethrough class based on checkbox state
          this.nameTarget.classList.toggle("line-through", checked);
          this.nameTarget.classList.toggle("text-primary", checked);
        }
      })
      .catch((error) => {
        console.error("Error updating quest:", error);
        // Revert checkbox if there was an error
        console.error("Reverting checkbox state due to error");
        event.target.checked = !checked;
      });
  }
}
