As a swimmer, I realized the need for personalized training. This is overlooked when being in a team, as coaches couldn't possibly make a custom workout for each of their 20 or 30 swimmers.

I developed an app, Stream.ai, that provides tailored dryland workouts based on a swimmer’s preferred stroke (butterfly, backstroke, breaststroke, and freestyle). The app also captures live video from the device’s camera using the AVFoundation library and utilizes computer vision via the Vision library to identify a person’s pose, determining whether they are doing the exercises properly.

In implementing this, I trained an Action Classifier model using 300+ videos on Create ML, allowing it to classify four dryland exercises (push-ups, squats, bicycle crunches, and bicep curls) with an accuracy of approximately 90.2%. I then imported the CoreML library to integrate the model within the app playground.

I envision that Stream.ai will pave the way for swimmers of different backgrounds to gain access to personalized training, giving them ownership over their training. Looking ahead, I’m excited to see the future of further integrating AI in swimming and hopefully other sports as well.
