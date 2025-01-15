import consumer from "channels/consumer"

consumer.subscriptions.create("NotificationsChannel", {
  connected() {
    console.log("connected")
  },

  disconnected() {
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
