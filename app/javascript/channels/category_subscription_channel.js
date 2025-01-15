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