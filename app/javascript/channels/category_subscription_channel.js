// import consumer from "./consumer"

// consumer.subscriptions.create("CategorySubscriptionChannel", {
//   connected() {
//     // Called when the subscription is ready for use on the server
//   },

//   disconnected() {
//     // Called when the subscription has been terminated by the server
//   },

//   received(data) {
//     // Called when there's incoming data on the websocket for this channel
//   }
// });

import { createConsumer } from "@rails/actioncable";

const consumer = createConsumer();

const subscribeToCategory = (categoryId, onReceived) => {
  return consumer.subscriptions.create(
    { channel: "CategorySubscriptionChannel", category_id: categoryId },
    {
      received(data) {
        onReceived(data);
      }
    }
  );
};

export default subscribeToCategory;