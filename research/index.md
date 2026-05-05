---
layout: mainpage
date: 
modified:
excerpt:
tags: [Research]
image:
  feature: desk_banner.jpeg
  credit: jdyeakel
---

<!-- dontshow -->

## $$\because$$ Research Interests $$\because$$

<!-- ## $$\because$$ Quantitative Ecological Dynamics Group $$\because$$   -->

> *"What counts is that I have discovered the question to ask and a good question is, of course, the key by which infinite answers can be educed"*  
> *-Isaac Asimov (Foundation's Edge)*  

<p>
  <span class="firstcharacter">W</span>
  e are theoretical (paleo)ecologists motivated by the search for generalities shaping and constraining the root ecological mechanisms from which macroevolutionary patterns emerge.
  To gain a mechanistic understanding into ecological process, we primarily employ theoretical and computational toolkits that allow us to construct a series of hypothetical relationships into a model from which the dynamical fallout can be compared against nature.
  While the complexity of such a model can never replicate the complexity of nature, it may cast a silhouette that relates to the natural world.
  By deploying models that capture these silhouettes from multiple angles, we seek to understand how the constraints operating on individuals within populations, and populations within communities, contribute to the long-term ecological and evolutionary dynamics shaping ecosystems past, present, and future.
</p>

---

<style>
  .research-topics {
    list-style-position: outside;
    padding-left: 1.35em;
  }

  .research-topics li {
    margin-bottom: 1em;
  }

  .research-topic-row {
    align-items: center;
    display: flex;
    gap: 1.2em;
    justify-content: space-between;
  }

  .research-topic-text {
    flex: 1 1 auto;
  }

  .research-topic-image {
    border: 1px solid #333332;
    border-radius: 50%;
    box-sizing: border-box;
    clip-path: ellipse(50% 50%);
    flex: 0 0 92px;
    height: 92px;
    object-fit: cover;
    position: relative;
    transform: scale(1);
    transition: transform 260ms cubic-bezier(0.34, 1.56, 0.64, 1);
    width: 92px;
    z-index: 1;
  }

  .research-topic-image:hover {
    transform: scale(1.2);
    z-index: 2;
  }

  .research-topic-image-placeholder {
    border: 1px dashed #333332;
    display: block;
  }

  @media (prefers-reduced-motion: reduce) {
    .research-topic-image {
      transition: none;
    }
  }

  @media (max-width: 520px) {
    .research-topic-row {
      align-items: flex-start;
      gap: 0.8em;
    }

    .research-topic-image {
      flex-basis: 68px;
      height: 68px;
      width: 68px;
    }
  }

  .paper-overlay {
    align-items: center;
    backdrop-filter: blur(5px);
    -webkit-backdrop-filter: blur(5px);
    background: rgba(255, 255, 255, 0.12);
    display: flex;
    height: 100%;
    justify-content: center;
    left: 0;
    opacity: 0;
    pointer-events: none;
    position: fixed;
    top: 0;
    transition: opacity 220ms ease;
    width: 100%;
    z-index: 9999;
  }

  .paper-overlay.visible {
    opacity: 1;
  }

  .paper-box {
    background: #ede8dd;
    clip-path: polygon(
      0% 4%, 3% 1%, 7% 5%, 11% 0%, 15% 3%, 19% 1%, 23% 5%, 27% 0%,
      31% 3%, 35% 1%, 39% 5%, 43% 0%, 47% 3%, 51% 1%, 55% 5%, 59% 0%,
      63% 3%, 67% 1%, 71% 5%, 75% 0%, 79% 3%, 83% 1%, 87% 5%, 91% 0%,
      95% 3%, 99% 1%, 100% 3%,
      100% 97%,
      97% 100%, 93% 96%, 89% 100%, 85% 97%, 81% 100%, 77% 96%, 73% 100%,
      69% 97%, 65% 100%, 61% 96%, 57% 100%, 53% 97%, 49% 100%, 45% 96%,
      41% 100%, 37% 97%, 33% 100%, 29% 96%, 25% 100%, 21% 97%, 17% 100%,
      13% 96%, 9% 100%, 5% 97%, 2% 100%, 0% 97%,
      0% 4%
    );
    filter:
      drop-shadow(0 0 1px #4a4a4a)
      drop-shadow(0 0 1px #4a4a4a)
      drop-shadow(0 6px 28px rgba(0, 0, 0, 0.24));
    font-family: 'EB Garamond', serif;
    font-size: 1.25rem;
    line-height: 1.2;
    max-width: 480px;
    padding: 3.5em 2.5em 3em;
    width: 88%;
  }
</style>

As of **Summer 2026**, some exciting current areas of active research include:

<ul class="research-topics">
  <li>
    <div class="research-topic-row">
      <span class="research-topic-text">How the bioenergetics of terrestrial predation influenced the evolution of carnivores and their herbivore prey throughout the Cenozoic. <a href="https://esajournals.onlinelibrary.wiley.com/doi/10.1002/ecy.70390" target="_blank" rel="noopener">Just Published!</a></span>
      <img id="pred-paper-img" class="research-topic-image" src="/images/pred_square.jpg" alt="Terrestrial predator and prey research image">
    </div>
  </li>
  <li>
    <div class="research-topic-row">
      <span class="research-topic-text">The origin of the allometric scaling of body fat and its macroevolutionary implications (publication coming soon!)</span>
      <img id="fat-paper-img" class="research-topic-image" src="/images/elephant_square.jpg" alt="Body fat allometry research image">
    </div>
  </li>
  <li>
    <div class="research-topic-row">
      <span class="research-topic-text">How marine megapredators such as <em>Otodus megalodon</em> (and other giant megatooth sharks) and <em>Livyatan melvillei</em> (and other giant raptorial whales) balanced their bioenergetic budgets, and the implications this likely had for Cenozoic marine communities</span>
      <!-- Replace this placeholder with: <img class="research-topic-image" src="/images/TBD_marine_megapredators_square.jpg" alt="Marine megapredator bioenergetics research image"> -->
      <img class="research-topic-image" src="/images/livyatan_square.jpg" alt="livyatan image">
    </div>
  </li>
  <li>
    <div class="research-topic-row">
      <span class="research-topic-text">Exploring how grazing, browsing, and mixed feeding mammals met their energetic needs with the opening of landscapes during the Eocene-Oligocene transition (34 Ma) and into the global cool-house characterizing the latter half of the Cenozoic</span>
      <!-- Replace this placeholder with: <img class="research-topic-image" src="/images/TBD_grazing_browsing_square.jpg" alt="Grazing and browsing mammals research image"> -->
      <img class="research-topic-image" src="/images/gazelle_square.jpg" alt="Body fat allometry research image">
    </div>
  </li>
</ul>

<div id="pred-paper-overlay" class="paper-overlay" aria-hidden="true">
  <div class="paper-box">
    <p>Body size constrains trophic interactions, shaping the feasibility of species' populations. Over macroevolutionary timescales, these constraints feed back to shape selection on body size and diet. We develop a bioenergetic, three-level trophic framework -- typical of terrestrial mammalian ecosystems -- to explore how bioenergetic trade-offs emerging from predator-prey interactions constrain coexistence. We show that interactions among predators, prey, and subsidies destabilize populations at both small and large sizes, matching observed limits to predator size and diet. These instabilities constrain coexistence and highlight a feasible predator size range of ca. 40-110 kg, spanning the mean size of terrestrial Cenozoic hypercarnivores. Finally, we show that decreased dietary selectivity confers a fitness advantage to larger carnivores that wanes at the largest sizes, aligning with diet estimates for contemporary and Pleistocene species. Our results underscore that ecological pressures emerging from trophic interactions, rooted in energetics, give rise to selective forces driving observed macroevolutionary patterns.</p>
  </div>
</div>

<div id="fat-paper-overlay" class="paper-overlay" aria-hidden="true">
  <div class="paper-box">
    <p>Energy stored as adipose fat is the primary endogenous buffer against starvation among mammals, yet fat mass \(M_f\) has been understood to scale superlinearly with adult body mass \(M\). Despite the importance of this pattern for hypotheses linking body size to starvation resistance and its potential role in driving the evolution of larger body sizes, its mechanistic origin remains unresolved. Here we combine an expanded empirical synthesis with a minimal mechanistic model to show that superlinear fat scaling is an inevitable consequence of foraging in resource-limited environments. First, assembling seven published datasets -- spanning shrews to blue whales -- confirms that adding marine mammals and recent terrestrial data produces a new measurement of the mass-fat exponent and leaves the superlinearity unchanged. Second, we explore its origin with a stochastic daily foraging model in which herbivores traverse a bite-scale resource landscape, accruing size-dependent gains and costs. When resources are plentiful and gut-limited, gain surplus scales sublinearly, but when resources are scarce and time-limited, gain and cost exponents diverge, driving a superlinear gain surplus, which we equate with future fat stores. Matching the empirical exponent requires a 37% daily energetic surplus above maintenance and demographic costs -- independent of body size -- consistent with populations living near the margin of resource depletion. Together, our framework recasts the mass-fat allometry as a physiological imprint of ecological scarcity rather than purely metabolic design. </p>
  </div>
</div>

<script>
  (function () {
    function attachOverlay(imgId, overlayId) {
      var img = document.getElementById(imgId);
      var overlay = document.getElementById(overlayId);
      if (!img || !overlay) return;
      img.addEventListener('mouseenter', function () {
        overlay.classList.add('visible');
      });
      img.addEventListener('mouseleave', function () {
        overlay.classList.remove('visible');
      });
    }
    attachOverlay('pred-paper-img', 'pred-paper-overlay');
    attachOverlay('fat-paper-img', 'fat-paper-overlay');
  }());
</script>




<!-- Our specific research interests can be categorized into four primary themes that operate on different scales.
Threading through each is our interest in understanding how consumer foraging behaviors drive the large-scale dynamics of populations and communities over both ecological and evolutionary time.
Because of our focus in theory, we work on a wide variety of systems.  



* What are the ecological constraints that shape individual foraging behaviors?  
* Can ecological processes be used to understand and predict macroevolutionary dynamics?  
* How do individual behaviors influence population dynamics over eco--evolutionary timescales?  
* How does the reticulate nature of species interactions influence the ecological and evolutionary dynamics of communities?  
 -->



<!---
> **If any of these topics are of interest to you...**
> I'll be starting as an Assistant Professor at the University of California, Merced (gateway to Yosemite) on January 1, 2016, and looking to work with excited students interested in applying both theoretical and empirical approaches to unravel ecological complexities! [Send me an email!](mailto:jdyeakel@gmail.com)
-->
