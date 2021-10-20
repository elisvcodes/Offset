## NOTE FOR TTP Residency Application
Nelson Wang was responsible only for the Flutter Mobile App. (which you can review the demo on the desktop using the following link: https://descartable-server.web.app/#).

- Here is the [video explaination of the project](https://play.google.com/store/apps/details?id=com.theevilbusiness.offset).
- This project is also available for [download in Google Playstore](https://play.google.com/store/apps/details?id=com.theevilbusiness.offset).
- Desktop Browser [Quick Demo Link](https://descartable-server.web.app/#).

### How to Install the flutter application remotly

Requires to have installed flutter in your local machine

1. Clone the repository
2. Open the location of the mobile application project from your terminal (/Mobile/api_sustainability)
3. Run: ```flutter build```


## Demo Note
The Flutter app is available as a web demo here: https://descartable-server.web.app/#
However it wasn't designed for desktop browsers, but as a mobile app, therefore, it will appear stretched, to make it simulate like an app, you have to make your browser width the smallest as you can. The other alternative is cloning the repo go to mobile/api_sustainability and run the android/IOS emulator (https://github.com/elisvcodes/Offset/tree/master/Mobile/api_sustainability)

[![Capture](https://i.ibb.co/8jf29Dd/capture.png "Capture")](https://i.ibb.co/8jf29Dd/capture.png "Capture")

###### Demo Specific Feature ("+1" Day button)
The plus one-day button is only for demo purposes. It adds one day to the track so you can simulate how the profile would look like as days passess. Or how much carbon emissions you produce over time (and what achievements you receive).
In a market version, it wouldn't have such a button, it would just count the days. 

## About
Sustainability is the focus on solving present problems without compromising future solutions. The concept divides into three categories: economic, environmental, and social. In Hack Brooklyn 2021, we have chosen to create a solution that will solve our current environmental sustainability issue that plagues us today. Our idea is to allow individuals to track their carbon footprint when making lifestyle decisions to use reusable everyday items. These items include water bottles, food containers, household cups, bags, and many others.

The main issue we are facing with individual efforts for sustainability is understanding we are making a difference even if the difference is small. If we all think our impact is insignificant, no one will do their part. Therefore, we hope to create an environment where individuals can track the reduction of their carbon footprint when they choose renewables in place of non-renewables. Because reusables release a lot more emissions when manufactured compared to non-reusable items, we need to use these reusables a certain number of times, or greater, before we throw them away. This is to offset the carbon footprint we have made when the reusable was manufactured. In other words, we answer the question of “how many times do I need to use a cotton bag until I offset the emissions when comparing to using a new plastic bag each time for the same number of times?”. Many are disposing or replacing reusable items before they can offset their emissions. With this application, we aim to visualize an individual’s progress in offsetting their carbon footprint. 

When an individual starts using a reusable item and registers it onto the application, we graph their carbon footprint against a footprint they would have made if they use an alternative non-reusable item instead. In the beginning, on the first day of the switch to a reusable, the carbon footprint of the reusable is vastly greater than the footprint of a non-reusable item. For each use of the item, the gap between the footprints becomes smaller and smaller because a reusable does not create more emissions while the individual would need to replace the non-reusable after every use, thus their emission would increase. The point of interest is when the footprint of both the reusable and non-reusable items would intersect. This is where the reusable item’s emission would offset itself. For some reusables, their emissions are so great, that it would take centuries to offset their carbon footprint. Therefore, the application would show the individual better alternatives, hoping they make the switch.

We created two applications, one web, and the other mobile with solid foundations. The issue we had was the lack of time and manpower. Therefore, we have focused instead on the scalability of our app. We made sure our brand and direction allowed for better features to be implemented after. Features like allowing the user to offset their water footprint, allowing users to add their own items by inputting their item’s footprint, material makeup, lifespan, time for the item to fully biodegrade, and many other properties. Also, achievements for the users for those who are adventurous, and leaderboards for the competitive. Our goal was to help individuals visualize their progress of offsetting their footprint and motivate them to keep going.
## Inspiration
An average individual’s effort towards a cleaner and better world is as small of a difference as a water droplet makes in an ocean. Making cleaner and greener decisions can be hard when the results of your efforts are small and hard to quantify. Therefore, we set on creating an application where users can track their carbon footprint with visuals and inform the user to make better and greener choices when making their purchases. 


## What it does
The application compares the carbon footprint between reusable and non-reusable items. Because reusables release more emissions during production when compared to non-reusables, reusable items need to be used a certain amount of times before they offset their carbon footprint. Therefore, we have created an application with an aim to track how many times a reusable item needs to be used in order for its carbon footprint to be offset. 

#### Network
[![NETWORK IMAGE](https://i.ibb.co/XkY2SmW/NETWORK-2.png "NETWORK IMAGE")](https://i.ibb.co/XkY2SmW/NETWORK-2.png "Capture")

#### Gamification
[![tree growing](https://i.ibb.co/v3c0sdF/treegrw.png "tree growing")](https://i.ibb.co/v3c0sdF/treegrw.png"tree growing")
[![tree growing](https://i.ibb.co/4Mqs3KF/achievements.png "Achievements")](https://i.ibb.co/4Mqs3KF/achievements.png "Achievements")


## How we built it
- Mobile (IOS/Android): Flutter
 - Libraries: 
   - cupertino_icons,   
   - flutter_sparkline: ^0.1.0,
   - fl_chart: ^0.35.0,
   - icofont_flutter: ^1.3.0
   - material_design_icons_flutter: ^4.0.5955
   -  charts_flutter: ^0.10.0
   - font_awesome_flutter: ^9.0.0
- Web stack: Node.js, Express, MongoDB, React

##### Assets used (Credits):
- Store items image lists : https://docs.google.com/spreadsheets/d/1tAlIQ-9PlqtqF9XFfNaXwHGkaJnqhaw-y7Spq2rytVE/edit?usp=sharing (Most are from amazon)
- Seed to tree:  (Jay Gregorio) https://www.elephango.com/index.cfm/pg/k12learning/lcid/13222/The_Life_Cycle_of_a_Tree
- Achievement image: by Lrkgerr and Free for personal use only. https://www.subpng.com/png-qnm8xa/


We are sorry if we missed any assets used not included, please write to us. 

## Challenges we ran into
- First hackathon using flutter
- Networking: Backend connected to flutter (Firebase)
- Authentication token using the back-end
- Estimation of co2 emitted based on the variables


## Accomplishments that we're proud of
We built a web and mobile version. It was the first time working on a hackathon flutter base project.
-It works


## What we learned
Communication is something we needed to focus more on. 

## What's next for OffSet: Sustainability Tracking for Individuals
We have built the application to be scalable. Therefore, after completing the tracker for offsetting people’s carbon footprint, we want individuals to be able to track their water footprint as well. 
