import consumer from "./consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("connected")
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log("disconnected")
  },

  received(data) {
    console.log("data :", data)
    const notificationsList = document.getElementById("notifications");
    console.log(notificationsList)
    if (notificationsList) {
      notificationsList.insertAdjacentHTML("afterbegin", data);
    }
  }
});
