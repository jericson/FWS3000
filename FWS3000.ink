INCLUDE util.ink
INCLUDE config.ink

[Welcome to FWS 3000! This game is still in early access. While the alpha is text-only, the full game will be an immersive VR simulation. However, we think you will be nearly as amazed with the AI module which you are about to experience.]

[And now: FWS 3000!]
* [Click to Continue] 

- Which is your dominant hand?
* [{option(hand, "right")}]
* [{option(hand, "left")}]

- Which is your favorite flavor?
* [{option(flavor, "chocolate")}]
* [{option(flavor,"vanilla")}]
* [{option(flavor,"strawberry")}]
  
- [In the final game, these choices will be made naturally as you'll be able to reach out your hand and pick a flavor in the virtual reality environment. Obviously, using text is a lot less immersive. But we need to get this data to feed our artificial intelligence engine.] 
[By the way, I don't plan to interrupt the game with these side comments very often from here on out. I only want to make you aware of the differences between this demo version and the final product.]
You are in a beautiful garden area. It's a warm, sunny day with blue skies and soft light filtering through the foliage. Birds are singing to each other somewhere above and there's a babbling stream nearby. In front of you are three trees with three different flavors of fruit: chocolate, strawberry and vanilla.
  
- (grab_fruit) You reach out with your {hand} hand to grab {eaten:another} {flavor} fruit.

+ (eaten) [Eat the {flavor} fruit.] You take a tentative bite. The immediate taste, smell and texture overwhelm your senses. Without exactly thinking about it, you devour the rest of the fruit. {eaten == 1: You've never experienced anything like this before.} {eaten >= SATIATED: You are feeling full.}  -> grab_fruit
+ [Drop the fruit on the ground.]

- 
{not eaten: **Error: unexpected sequence. Resetting to last valid state.** -> grab_fruit}
{eaten < SATIATED: [I can't help but notice you only ate the fruit {print_ord(eaten)}. We trained the AI with users of our prototype VR system. It's incredibly realistic and most people can't help but eat the fruit many more times than that. I don't think it'll be a problem, but you can sample the fruit more times if you'd like to be safe. Thanks!]}
{eaten == SATIATED: Yeah, that's right: {SATIATED}.}

- What would you like to do next?

+ [Eat more fruit] -> grab_fruit
+ [Explore the garden]

 - (description) You look around the garden. It's teeming with life and you feel you could stay here for a very long time and never grow tired of enjoying this place. {not final:A short way off is a section of wall with a huge gate.}

- (explore)

TODO: Add more descriptions!
+ [Explore more]
  {shuffle:
    - A lizard scampers from one rock to another. It's not scared, but rather seems eager to warm itself in the sun.
    - The stream is swift and cool. Water splashes around the rocks and eddies in quiet pools near the shore.
    - Two squirrels play in the branches above your head. Perhaps this is part of their mating ritual?
    - You climb to the top of a house-sized boulder. You reach out to touch a patch of moss growing on the rock. It's so soft, you decide to use it as a pillow. Staring up into the sky you let your mind see fantastic shapes in the clouds: dragons, butterflies, giant's clubs, and so on. You aren't really tired, but it just feels good to daydream in the comfortable warmth of the sun.
    - You come to a meadow filled with wildflowers of all hues. The air is still except for the steady buzz of bees harvesting nectar. Suddenly you notice a huge bear standing on the other side of the meadow. You should be terrified, but somehow you are calm as you walk toward the majestic beast. Neither does it seem fearful of you; nothing could harm it here. Before you get close enough to touch its dark, thick fur, the bear looks you in the eye, turns toward the treeline and saunters away. 
  }
  -> explore
+ [Go back to the fruit trees] -> grab_fruit
+ {not final} [Examine the gate]

- The gate and wall are huge and very old. Even so, both are well maintained. It's difficult to know whether they are intended to keep things out of the garden or in it. As you get closer, you notice the gate isn't quite closed. There's a narrow opening which you could squeeze through.

+ [Explore the garden some more] -> description
+ [Try to leave the garden]

- The opening does seem just the right width for you to get through if you turn to one …
[Sorry to interrupt. It's awkward, but we've never had anyone choose to leave the garden. So we … kinda … didn't build the "outside the garden" level. Maybe if you go back to get more of that scrumptious {flavor} fruit, you'll have the energy to explore some more.]
+ [Get more {flavor} fruit] -> grab_fruit
+ [Look through the gate to the outside]

- (final) Beyond the gate is a grassy plain. There are no trees or any other obvious forms of sustenance. It's not exactly dead, but it is barren compared to the garden. What, if anything, lies beyond the horizon cannot be determined.
[So our AI has filled in something outside the gate, but I have no idea what will happen if you continue on. Well, I do have one idea: we're closing the gate for good. Building the virtual garden has been a huge drain on our resources so we can't possibly afford to flesh out the rest of the world. I'm glad you tested this out for us. Please decide whether you want to leave the garden or stay here with us. Either way, the choice is yours and it's final.]
* [Turn back and explore the garden] -> description
* Leave the garden and never return.

-> END
// LocalWords: FWS VR util config TODO ord 
