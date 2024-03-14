### Generative vs. Interpretive

## Create from an uninformative prior

Write an observation of shoppers in a grocery store in the tone of David Attenborough narrating a nature documentary

***Summarize findings***
Summarize the paper written by Sinclair and Brashares in Nature 2003 - read it carefully and summarize all of the main findings.

### Use a trained GPT
***Do some background research on a subject that you are learning more about***

Describe some major evolutionary events during the Cenozoic that impacted mammalian communities. Specify particular assemblages that are known for documenting each event. Provide specific scholarly citations for each major event.


***Train your GPT on a textbook and have it write an exam***
Create 10 multiple choice questions (a-e) of varying levels of difficulty on chapters 1-3.


***Use the wolfram plugin for calculations***
What was the date 10000 years ago?

What does the thyroid gland look like and how big is it?

Solve x^6-8x^2+7x=2

What are the populations of the 20 largest cities in the USA?

What is the phylogenetic tree between Cetacea and Proboscidea? Specify estimated splitting times for the different clades.


***Design code from scratch***
We have a morphospace (PC-1 vs. PC-2) where we have found 4 different beak morphology spaces (clusters) that accord to different dietary modes. We have measures for some extinct bird beaks, and those measure put them in different places in the PC morphospace. What statistical approach should we use to assign probabilities that the extinct beaks belong to each dietary group?


You get a prize - so helpful! Help us tackle this problem using the GMM approach. We are using R, and the geomorph package to compute the PCA. Help us code up a classification analysis using GMM in a general sense in R.


***Learn coding best practices***
I'm trying to teach myself how to write code in package style within julia. I've heard this is the best practices way to maintain and share code, especially through a repository on github. I usually just write code local to my computer, but writing code projects as a package should help portability versioning and reliability. Still, I know very little about it, but am familiar with using the terminal and syncing to github. Let's put together a tutorial to help me learn how to do this. I can then share this tutorial with the lab. Let's not rely on specialized packages to do this - let's us the internal package environment instead. Note I use the zsh environment instead of bash.


## Create from a strong prior

***Text from a methods section to build the latex table***

    Here are methods from a scientific paper I'm writing. Please create a table in latex for all of the variables, their definitions, and their units. If you are uncertain about a meaning or definition, but an asterisk before it.

    ```latex
    Within a tri-trophic food chain, the energy available for somatic growth, maintenance, and reproduction for a predator population ($P$) is limited by its consumption of a consumer prey population (${C_i}$), which in turn is limited by the consumption of a plant resource ($R$) (units g/m${}^2$).
    these are invariant requirements of the consumer population \cite{yeakel2018dynamics}.
    The growth of the predator population is fueled by the mortality it inflicts on its consumer prey with rate $w\lambda_P/Y_P$, where $w_i$ is the proportional reliance of the predator on the consumer, $\lambda_P$ is the predator's effective growth rate, and $Y_P$ is the predator yield coefficient, or the grams of predator produced per gram of prey consumed.
    We assume the predator's effective growth rate follows a linear Type I functional response across the consumer population density ${C_i}$, and is maximized at $\lambda_{C_i}^{\rm max}$.
    When the predator does not rely completely on the consumer (i.e., $\sum_i w_i < 1$), the remainder of predator growth $w_S$ is obtained from a constant subsidy $S$, which represents any other alternative prey or resources (in the case of an omnivore predator, for instance).


    The rate of consumption fueling the herbivore consumer's population is proportional to the resource density and is given by $\lambda_{C_i}(R)/Y_C$, where $\lambda_{C_i}(R)$ is the effective consumer growth rate and $Y_{C_i}$ is the consumer yield coefficient, or the grams of consumer produced per gram of resource consumed \citep{Kempes:2012hy}.
    We assume the consumer's growth rate $\lambda_{C_i}(R)$ follows a Type II functional response \citep{DeLong:2012fjb} across the resource density $R$, where the maximum growth is $\lambda^{\rm max}_{C_i}$ and the resource half-saturation density is $\hat{k} = k/2$. 


    Predator mortality is the product of natural mortality $\mu_P$, while consumer mortality includes the effects of natural mortality, $\mu_{C_i}$, starvation mortality $\sigma_{C_i}(R) = \sigma_{C_i}^{\rm max}(1- R/k)$ -- which is inversely proportional to resource density \citep{yeakel2018dynamics,rallings2022dynamics} -- and predation.
    The general tri-trophic system can then written as
    \begin{align}
        \frac{\rm d}{\rm dt}P &= \bigg(\sum_{i=1}^N w_i\lambda_P C_i + w_S\lambda_P^{\rm max} S\bigg)P - \mu_P P, \nonumber \\
        \frac{\rm d}{\rm dt}C_i &= \lambda_{C_i}(R)C_i - \bigg(\mu_{C_i} + \sigma_{C_i}(R) + \dotsb \bigg)C_i + \sum_{i=1}^N w_i\frac{\lambda_P}{Y_P}PC_i, \nonumber \\
        \frac{{\rm d}}{{\rm dt}}R &= \alpha \left(1 - \frac{R}{k} \right)R - \frac{\lambda_{C}(R)}{Y_{C}}C,
        \label{eq:3d}
    \end{align}
    where $\lambda_{C_i}(R) = \lambda_{C_i}^{\rm max}\frac{R}{\hat{k} + R}$ and $\lambda_P = \lambda_P^{\rm max}/Y_{C_i}k$.
    % Here, $w$ describes the proportional contribution of $C$ to the population growth of $P$ relative to the subsidy $S$.
    % Here, $w_i$ and $w_S$ describes the proportional contribution of $C_i$ and the subsidy $S$ to the population growth of $P$, respectively.
    The $\dotsb$ symbol in the consumer equation signifies the potential inclusion of additional sources of external mortality, such as harvesting, which we will address in the discussion.
    The rate laws describing the growth and mortality of both predator and consumer species vary as a function of predator body mass $M_P$ and consumer body mass $M_C$, representing a mammalian carnivore and herbivore, respectively. 
    We approach the derivation of vital rates with respect to predator and consumer mass by solving for multiple timescales associated with ontogenetic growth, maintenance, and expenditure, based on the energetic trade-offs associated with somatic growth and maintenance during ontogenetic growth.
    See the Supporting Methods for our derivation of vital rates using this approach, also detailed in \cite{yeakel2018dynamics} and \citet{rallings2022dynamics}.


    We will consider two versions of the tri-trophic motif described in Equation \ref{eq:3d}.
    First, we will assess the influence of a subsidized predator that is otherwise specializing in a single mammalian prey, where $N=1$, and $w_1 + w_S = 1$.
    In this food chain, we assume the subsidy is constant, and therefore does not react dynamically to changes in the predator's population density.
    Second, we will assess a two-consumer system without predator subsidization, where $N=2$ and $\sum_i w_i = 1$ (with $w_S = 0$), such that the predator consumes two mammalian prey, both of which compete for the shared resource.
    In this tri-trophic competition model, we assume that herbivore consumer 1 is the predator's primary (preferred) prey and herbivore consumer 2 is the secondary prey.

    Whether or not two species engage in a trophic interaction given their respective traits drives the structures of food webs.
    Trophic interactions are often constrained by body size \citep{Sinclair2003,Brose2005,Hatton:2015fk}, with large prey generally suffering mortality from large predators, though the nature of predator-prey mass relationships (PPMRs) varies across communities \citep{barnes2010global,nakazawa2017individual}, organismal body size \citep{Brose2005,Rohr2010,riede2011stepping,Yeakel2014,pires2015pleistocene}, and may be driven by the optimization of handling time among predator consumers \citep{delong2020detecting}.
    Because the timescales of vital rates are mechanistically derived from energetic trade-offs characterizing the metabolic processes of both consumers and predators, such an approach requires that consumer and predator masses relate in ecologically meaningful ways.
    The relationship that determines how the consumer's mass $M_C$ relates to the predator's mass $M_P$ is provided by the expectation ${\rm E}\{M_C|M_P\}$, which we obtain from observational data.
    This expectation follows a power law across $M_P$, where the slope 
    has been shown to be roughly linear \citep{Carbone:1999ju} or slightly superlinear \citep{Uiterwaal2022}, with theoretical expectations from resource use optimization predicting a slope of ca. 1.23 \citep{delong2020detecting}.
    By integrating high resolution data sets for large-bodied mammalian carnivores \citep{hayward2005lion,Hayward2006hyena,hayward2006leopard,hayward2006lycaon,hayward2006cheetah,Hayward2008}, the measured slope increases slightly to ca. 1.46 (see \ref{supp:ppmr}).
    ```

***Comment your Code***

Here is some code to build an SDP to explore a patch choice foraging model. I've commented here and there, but really would like to make it more descriptive so I won't forget what things are. I've also forgotten what some things are so make some comments to help me out! Thanks - if you do a great job I'll give you a back rub.

```R
tmax <- 500

xc <- 2 

xmax <- 10 

K = 150 
nmax = K*2 

#cost
c = c(1,1) 
p = c(0,2)*K 
f = c(1,0.5) 
d = c(0.01,0.02) 
r = c(1,0) 

rscale = 0.5;

np = length(c) 

W = array(0,dim=c(xmax,nmax,tmax))
D = array(0,dim=c(xmax,nmax,tmax))


for (x in 1:xmax) {
  for (n in 1:nmax) {
    if (x <= xc) {
      W[x,n,tmax] <- 0 
    } else {
      # W[x,tmax] <- 1 
      W[x,n,tmax] <- max(r*((x*rscale)/xmax))
    }
  }
}

#boundary condition function
bc <- function(xvalue) {
  if (xvalue <= xc) {
    xvalue <- xc 
  }
  if (xvalue > xmax) {
    xvalue <- xmax 
  }
  return(xvalue)
}

interpolate <- function(xvalue,nvalue,W,t) {
  lowx <- floor(xvalue)
  highx <- lowx+1
  px <- highx-xvalue
  lown <- floor(nvalue)
  highn <- lown+1
  pn <- highn-nvalue
  Winterp <- 0
  if (pn < 1 && px == 1) {
    Winterp <- px*pn*W[lowx,lown,t+1] + px*(1-pn)*W[lowx,highn,t+1]
  }
  if (pn == 1 && px < 1) {
    Winterp <- px*pn*W[lowx,lown,t+1] + (1-px)*pn*W[highx,lown,t+1]
  }
  if (pn == 1 && px == 1) {
    Winterp <- px*pn*W[lowx,lown,t+1]
  }
  if (pn < 1 && px < 1) {
    Winterp <- px*pn*W[lowx,lown,t+1] + px*(1-pn)*W[lowx,highn,t+1] + (1-px)*pn*W[highx,lown,t+1] + (1-px)*(1-pn)*W[highx,highn,t+1]
  }
  return(Winterp) 
}


for (t in seq(tmax-1,1,-1)) {
  
  for (n in 1:nmax) {
  
    for (x in (xc+1):xmax) {
      
      value = numeric(np)
      
      for (i in 1:np) {
        
        # what is x if you find food?
        xp <- x - c[i] + p[i]/n 
        
        # what is x if you don't find food?
        xpp <- x - c[i] 
        
        xp <- bc(xp) 
        
        xpp <- bc(xpp) 
        
        Wxp <- interpolate(xp,n,W,t)
        Wxpp <- interpolate(xpp,n,W,t)

        value[i] <- (r[i]*((x*rscale)/xmax)) + (1-d[i])*f[i]*Wxp + (1-d[i])*(1-f[i])*Wxpp 
        
      } # end i loop
      
      maxvalue <- max(value) 
      istar <- which(value == maxvalue) 
      
      W[x,n,t] <- maxvalue 
      D[x,n,t] <- istar 
      
    }
  
  }

}


pop0 = 5
X = rep(floor(xmax/2),pop0) 
pop = numeric(tmax-1)

for (t in 1:(tmax-1)) {
  pop[t] = length(X)
  
  offspring <- 0 
  
  if (pop[t] > 0) {
  
    for (i in 1:length(X)) {
      
      state <- X[i] 
        
      #which activity do I choose?
      dec <- D[floor(state),pop[t],t] 
      
      #Reproduce
      r_draw = runif(1)
      if (r_draw > (1 - r[dec]*(state*rscale)/xmax)) { # changed 10 26 2023
        offspring <- offspring + 1
      }
      
      #Do I die during this activity?
      d_draw = runif(1) 
      
      #IF you survive, look for food
      #If d_draw = 1, then you always survive
      if (d_draw < (1 - d[dec])) {
        
        #Do I find food during this activity?
        f_draw = runif(1) 
        
        if (f_draw < f[dec]) {
          #Do find food
          newstate = state + p[dec]/pop[t] - c[dec] 
        } else {
          #Don't find food
          newstate = state - c[dec] 
          
        }
        
        #Apply boundary conditions
        newstate = bc(newstate) 
        
      } else {
        newstate = xc 
      }
      
      #update state for next time interval
      X[i] = newstate 
    }
    
    #remove the dead
    stayalive <- which(X >= xc+1)
    X <- X[stayalive]
    
    #add offspring
    Xadd = floor(offspring)
    offspringstart = floor(xmax/2.5)
    if ((length(X) + Xadd) > nmax) {
      newX = rep(offspringstart,nmax)
      newX[1:length(X)] = X
      X = newX
      X = X
    } else {
      newX = rep(offspringstart,Xadd)
      X = c(X,newX)
    }
    
  }
  
}

par(mfrow=c(1,2))
plot(pop,type='l',xlab = 'Time',ylab='N(t)')
plot(pop[1:(tmax-2)],pop[2:(tmax-1)],xlim=c(0,300),ylim=c(0,300),type='l',xlab='N(t)',ylab='N(t+1)')
lines(seq(0,300),seq(0,300),type='l',lty=3)

```

***Translate the same code to Julia***

Please translate that same R code into Julia, along with comments.

***Reverse: From a table create descriptive text***

Here is a curriculum map for our new EECB (Ecology evolution and conservation biology) major. Write some text to describe the major fromt the curriculum map, and compare/constrast with the Biology major. Keep your descriptions technical, nonflowery, and specific.

EECB-GENERAL TRACK




CORE LOWER DIVISION COURSES

Complete the following nine lower division core science courses:

Biology
	•	BIO 011 [4 units] and 011L [1 unit] - Introduction to Molecular Biology and Lab
	•	BIO 012 [4 units] and 012L [1 unit] - Introduction to Organismal Biology and Lab

Quantitative
	•	MATH 011 [4 units] - Calculus I
	•	MATH 012 [4 units] - Calculus II (MATH 011 or MATH 021)
	•	DATA 008 [4 units] - Introduction to Data Science

Chemistry
	•	CHEM 002 [4 units] - General Chemistry I
	•	CHEM 010 [4 units] - General Chemistry II (CHEM 002 or CHEM 002H or equivalent exam) and (MATH 011 or MATH 021 or equivalent exam or Concurrent)

Physics
	•	PHYS 018 [4 units] and 018L [1 unit] - Introductory Physics I for Biological Sciences and Lab; (MATH 011 or MATH 021 or equivalent exam or Concurrent)
	•	PHYS 019 [4 units] and 019L [1 unit] - (MATH 011 or MATH 021 or equivalent exam) and (PHYS 008 or PHYS 008H or PHYS 018 or equivalent exam) and (MATH 012 or MATH 022 or equivalent exam and Concurrent)



CORE UPPER DIVISION COURSES 

Complete the following five upper division core biological sciences courses:

Biology
	•	BIO 140 [4 units] - Genetics (BIO 002)
	•	BIO 141 [4 units] - Evolution (BIO 001 or BIO 011) and (BIO 002 or BIO 012) (Serves as GE Writing in the Discipline)
	•	BIO/ESS 148 [4 units] - Fundamentals of Ecology (BIO 001 or BIO 005 or BIO 011 or ESS 001 or ESS 005 or equivalent exam)
	•	BIO/ESS 149 [4 units] - Conservation Biology  (BIO 001 or BIO 011)


UPPER DIVISION QUANTITATIVE ELECTIVES

Select one from the list below.

List of BIO/ESS/MATH/DATA courses that are quantitative


UPPER DIVISION EECB ELECTIVES 

Select three from the list below.

	List of BIO/ESS courses that are ecology, evolution, or conservation themed


UPPER DIVISION PRACTICUM

Select one from the list below. If lab is separate, both lecture and lab component must be taken.

(List of BIO/ESS lab courses)



UPPER DIVISION NATURAL SCIENCES/ENGINEERING ELECTIVES [6-12 UNITS]

Complete three additional upper-division Natural Sciences or Engineering courses (minimum three units each). Relevant courses outside of Natural Sciences or Engineering may be allowed with approval. If lab is separate, both lecture and lab component must be taken.

(List of BIO/ESS courses)


GENERAL EDUCATION REQUIREMENTS
Lower Div GE: Spark
LD GE: Writing
LD GE: Quantitative Reasoning
LD GE: Language
Upper Div GE: Crossroads
UD GE: Writing in Disc (fulfilled by BIO 141 evolution)
UD GE: Culminating Exp
Area B - Soc
Area B - Hum
Area B - Soc/Hum
Area A - Life (fulfilled by BIO 12)
Area A - Physical (fulfilled by PHYS 018)


Biological Sciences Requirement [14 units]
Complete the following five biological sciences courses:

BIO 011: Introduction to Molecular Biology Units: 4
BIO 011L: Introduction to Molecular Biology Lab Units: 1
BIO 012: Introduction to Organismal Biology Units: 4
BIO 012L: Introduction to Organismal Biology Lab Units: 1
BIO 110: The Cell Units: 4


General Chemistry Requirement [8 units]
Complete the following two general chemistry courses:

CHEM 002: General Chemistry I Units: 4 or CHEM 002H: Honors General Chemistry I  
CHEM 010: General Chemistry II Units: 4 or CHEM 010H: Honors General Chemistry II  


Organic Chemistry Requirement [4 units]
Complete the following two organic chemistry courses:

CHEM 008: Principles of Organic Chemistry Units: 3 or CHEM 008H: Honors Principles of Organic Chemistry  
CHEM 008L: Principles of Organic Chemistry Lab Units: 1 or CHEM 008HL: Honors Principles of Organic Chemistry Lab  


Mathematics Requirement [8 units]
Complete the following mathematics courses:

MATH 011: Calculus I Units: 4
MATH 012: Calculus II Units: 4


Computer Science Requirement [2-4 units]
Complete one of the following courses:

BIOE 021: Introduction to Computing with Python Units: 4
CSE 019: Introduction to Computing Units: 4
MATH 015: Introduction to Scientific Data Analysis Units: 2
ME 021: Engineering Computing Units: 4


Probability and Statistics Requirement [3-4 units]
Complete one of the following probability and statistics courses:

BIO 018: Data Science for Life Sciences Units: 4
ECON 010: Statistical Inference Units: 4
MATH 018: Statistics for Scientific Data Analysis Units: 4
MATH 032: Probability and Statistics Units: 4
PSY 010: Analysis of Psychological Data Units: 5


Physics Requirement [8 units]
Complete the following four physics courses:

PHYS 018: Introductory Physics I for Biological Sciences Units: 3
PHYS 018L: Introductory Physics I for Biological Sciences Lab Units: 1
PHYS 019: Introductory Physics II for Biological Sciences Units: 3
PHYS 019L: Introductory Physics II for Biological Sciences Units: 1


Upper Division Science or Engineering Requirement [3-4 units]
Complete one additional upper division course in science or engineering.

Requirements for Ecology and Evolutionary Biology Emphasis Track

Ecology and Evolutionary Biology Core Courses [12 Units]
 Complete the following courses:

BIO 140: Genetics Units: 4
BIO 148: Fundamentals of Ecology Units: 4
BIO 141: Evolution Units: 4


Ecology and Evolutionary Biology Upper Division Elective Courses [13 Units Minimum]

Practicum Component [3-7 Units]
Complete one of the following courses. If lab is separate, both lecture and lab component must be taken.

List of BIO/ESS lab courses


Additional Elective Courses [10 Units Minimum]
Complete two or more of the following courses:

(List of BIO/ESS courses)

GENERAL EDUCATION REQUIREMENTS
Lower Div GE: Spark
LD GE: Writing
LD GE: Quantitative Reasoning
LD GE: Language
Upper Div GE: Crossroads
UD GE: Writing in Disc (fulfilled by BIO 141 evolution)
UD GE: Culminating Exp
Area B - Soc
Area B - Hum
Area B - Soc/Hum
Area A - Life (fulfilled by BIO 12)
Area A - Physical (fulfilled by PHYS 018)


***Score a paper based on a rubric***
Here is a student paper. Score this paper based on the provided rubric.

Rubric for Hypothesis, Student's position, and Explanation of issues:

Hypothesis: Testable and consider alternatives Hypotheses are clearly stated, testable and consider plausible alternative explanations
Capstone (4)	A comprehensive suite of testable hypotheses are clearly stated which, when tested, will distinguish among multiple major factors or potential explanations for the phenomena at hand.
Milestone (3)	Multiple relevant, testable hypotheses are clearly stated
-Hypotheses address more than one major potential mechanism, explanation or factors for the topic"
Milestone (2)	A single relevant, testable hypothesis is clearly stated
-The hypothesis may be compared with a ""null"" alternative which is usually just the absense of the expected result"
Benchmark (1)	No hypothesis indicated
-The hypothsis is stated but too vague or confused for its value to be determined
-A clearly stated and testable, but trivial hypothesis

Student's postion (perspective, thesis, and hypothesis)
Capstone (4)	Specific position (perspective, thesis/hypothesis) is imaginitive, taking into account the complexities of an issue. Limits of position (perspective, thesis/hypothesis) are acknowledged. Others' points of view are synthesized within position (perspective, thesis/hypothesis)
Milestone (3)	Specific position (perspective, thesis/hypothesis) takes into account the complexities of an issue. Others' points of view are acknowledged with position (perspective, thesis/hypothesis)
Milestone (2)	Specific position (perspective, thesis/hypothesis) acknowledges different sides of an issue
Benchmark (1)	Specific position (perspective, thesis/hypothesis) is stated, but is simplistic and obvious

Explanation of issues
Capstone (4)	Issue/problem to be considered critically is stated clearly and described comprehensively, delivering all relevant information necessary for full understanding.
Milestone (3)	Issue/problem  to be considered critically is stated, described and clarified so that understanding is not seriously impeded by omissions
Milestone (2)	Issue/problem to be considered critically is stated but description leaves some terms undefined, ambiguities unexplored, boundaries undetermined, and/or backgrounds unknown.
Benchmark (1)	Issue/problem to be considered critically is stated without clarification or description

And here is the student's paper:

Treating sea urchin embryos with various concentrations of ethanol
Introduction
In this study we exposed sea urchin embryos to ethanol ot examine the birth defects
ethanol causes, and the effects ethanol can have on the overall stages ni sea urchin development. Exposure to this teratogen during development leads to Fetal Alcohol Spectrum Disorder (FASD), a group of conditions that range from neurological ot skeletal patterning defect
(Eberhart and Parnel, 2016). We have reviewed the sea urchin's model system ot understand their normal development patterns and stages comparing this existing information to our experimentally grown sea urchin embryos. As challenging as this experiment was, using sea urchins to observe possible abnormalities ni early and late embryonic formation was considerably simple due ot their fast life cycles and transparency allowing us ot view their structures over a light microscope (Rodriguez-Sastre, Nahomie et al., 2022). In research studies, ethanol has been found to cause dramatic defects in skeletal patterning but does not perturb ectodermal dorsal-ventral specification (Rodríguez-Sastre, Nahomie et al,. 2023). With their data in mind our hypothesis was that if we induce high concentrations of ethanol to sea urchin embryos we are more likely ot se developmental defects than those induced at lower concentration of ethanol. We then treated sea urchin embryos with two high ethanol concentrations to perturb their distinctive physical features at the late gastrula and early prism stages. We found that only those embryos treated with high concentrations of ethanol have
 abnormalities in their archenteron and vegetal plates leaving the embryos with a poor prism formation.
Methods and Materials:
We observed the anatomy of the wild-type sea urchin embryo under the light microscope
to identify its stage and features. Then we observed the other four groups of embryos treated with various concentrations of ethanol under the light microscope to see the malformations and defects at their most current stage in development. Our experimental procedure goes as follows:
Shook full matured sea urchins to spawn unfertilized embryos.
Collect and fertilize the embryos with sperm from male sea urchins.
Obtained 95% ethanol stock solution (our developmental disruptor) and began to dilute the concentrated ethanol with sea water down to a range from 0.5% to 10%.
Calculate the amount of 95% ethanol and seawater needed to create 10%, 5%, 1%, and 0.5% ethanol concentrations.
Before transferring early embryos, take a look at them to observe the early stages of development.
Transfer a total of 4 ml of each dilution onto a tissue culture plate having 6 wells.
Label each well with its appropriate concentration mixture and place the sea urchin embryos going through early cleavage in each wel.
Place them in an incubator set ot 28 degrees celsius and let them grow for about 36 to 40 hours
Collect and observe embryos under the light microscope to record data once removed from the incubator. The embryos should now be ni the late gastrula and early prism stage.

 Results:
To see how ethanol affects development ni sea urchins, we incubated fertilized embryos
in four different concentrations of ethanol mixed with sea water. We observe the embryos at short term and long term exposure. Short term exposure refers to same day observation of the highest concentrations of ethanol at 10% and 5%. Long term exposure refers to observation of the embryos, two days after exposure to all concentrations of ethanol. For short term exposure at
10% ethanol we see that many of the sea urchin embryos display a double membrane or ring around the cells. The cells also look less opaque than the wild type so that may have indicated that they were in the process of lysing. At 5% short term exposure we also observed the embryos to have a double ring/membrane around the yolk. However these cells are a lot less translucent than the embryos at 10% ethanol.
At long term exposure of 10% we observe about 12 embryos. These embryos had a distinct double ring with their yolks becoming clear. Along with the yolks being clear, some of the embryos had a yolk that seemed to burst and take up al the space inside the embryo while
the outer membrane remained intact. Al of these seem to indicate the cells died. At 5% long term exposure we observed about 4 embryos. The embryos looked like they were not moving around like ni the 10% exposure. Most of these cells appeared to die and looked very similar to the embryos at 10% ethanol exposure.
Figure 1. 10% Ethanol long term exposure + You 6 : 3 9
IMG_0429
Done

 *There is a distinct double ring around the cells. The yolks as you can see are very dark with some spots turning almost clear and opaque. The cell on the bottom right appears to have its yolk burst.
Figure 2 and Figure 3. 5% ethanol long term exposure
*The embryo on the left has a less distinct double ring. The yolk also appears to be more deformed and look similar to the burst yolk of the 10% group.
For 1% ethanol exposure we observed about 21 embryos. These cells were still alive and
some were moving around. However these embryos seemed to all have deformed membranes
with indentations all around them. The embryos also seemed to have their yolks oriented to one side of the embryos with a cavity to the other side. One sea urchin embryo is spinning around in
one spot constantly. Al of the embryos are starting gastrulation at a slow rate 2 days later with the primitive guts forming. Some embryos appeared to have cells sticking out towards the outside of the embryos.
Figure 4. 1% ethanol long term exposure

 *Gastrulation started at a slow rate with the primitive gut starting to form. This specific cell was spinning constantly.
At 0.5% ethanol exposure we observed the most embryos at a total of about 40. These embryos also look slightly deformed similar to the ones exposed to 1% ethanol. We also observed that one embryo had an orange/purple pigmentation to the cell which is the first pigmented embryo we saw out of all the embryos. At this exposure we also saw many of the embryos had a mass of cells sticking out towards the outside of the embryo like in the 1% ethanol exposure.
FIgure 5. 0.5% ethanol long term exposure
*This embryo has an orange/purple pigmentation along the outer membrane. It also is not perfectly spherical and seems to be further along in development compared to the other observed eggs.

 When observing our control we see about 5embryos that are al perfectly spherical and moving around.
Discussion:
Just like in vertebrates, ethanol exposure during development leads to fetal alcohol
syndrome which is classified by neurological and skeletal defects (Rodriguez-Sastre, Nahomie et al., 2022). The same applies to sea urchin development. Many of the phenotypes we observed at
the different levels of ethanol exposure are perfectly described by this. At many of the concentrations we see the embryos as being not perfectly spherical anymore and have many indentations on the embryo. This is because of the cytoskeleton defects of the sea urchin embryo that does not allow the shape and stability of the plasma membrane to be kept up. However, according to the literature, the skeletal defects are likely due to ethanol being correlated with delayed timing of development of the cytoskeleton rather than actual disruption of development (Rodriguez-Sastre, Nahomie et al., 2022).
When looking at the 10% and 5% ethanol exposure concentrations of the embryos we see some of the yolks have burst in the embryo. This mechanism is not really known in the literature but this could be due to a difference in tonicity and osmolarity presented by ethanol molecules.

 This wil change the way ni which solvent flows from one area to another, possibly making the yolk take in too much solvent and then breaking.
The mass of cells sticking out of embryos when looking at concentrations of 1% and
0.5% can't also be explained. These are also possibly due to disrupted timing of developmental stages in the embryos. However looking at the lower concentration we see many cells spinning
around. At this point it is known alcohol exposure during development can lead to some skeletal and neurological defects. Ethanol is a tubulin destabilizing compound especially during development (Semenova, Kiselyov, Semenov 2018). The constant spinning of the embryos can be explained by this tubulin/skeletal destabilization during development. Tubulin destabilization by ethanol induced cleavage alterations, arrest and embryo spinning, especially at higher concentrations. The spinning of the embryos only lasts about 5-7 hours according to the literature and ti is then followed later on by death of the organism.
With this experiment we believe we were able to answer our question of whether or not developmental defects are more likely to occur at higher concentrations of ethanol. We have observed that yes developmental defects will occur at a higher rate in higher concentrations and the mortality rate will increase as well. Using sea urchin development exposure to alcohol creates great insight towards Fetal Alcohol Spectrum Disorder ni humans as wel. Let this be an example to people about the dangers of alcohol on development.
References :
• Adonin, Leonid et al. "Sea Urchin as a Universal Model for Studies of Gene Networks."
Frontiers in genetics vol. 1 627259. 20 Jan. 2021, doi: 10.3389/fgene.2020.627259

 • Rodriguez-Sastre, Nahomie et al. "Ethanol exposure perturbs sea urchin development and disrupts developmental timing." Developmental biology vol. 493 (2023): 89-102.
doi: 10.1016/j.ydbio.2022.11.001
• Eberhart, Johann K, and Scott E Parnell. "The Genetics of Fetal Alcohol Spectrum
Disorders." Alcoholism, clinical and experimental research vol. 40,6 (2016): 1154-65. doi: 10.1111/acer. 13066
• Reichard-Brown, Jan Let al. "Sea urchin embryos exposed ot thalidomide during early cleavage exhibit abnormal morphogenesis later ni development." Birth defects research. Part B, Developmental and reproductive toxicology vol. 86,6 (2009): 496-505.
doi: 10.1002/bdrb.20215
• Semenova, Marina N, et al. "Sea Urchin Embryo as a Model Organism for the Rapid Functional." Sea Urchin Embryo as a Model Organism for the Rapid Functional Screening of Tubulin Modulators, 21 May 2018, https://www.future-science.com/doi/10.2144/000112193.




***Summarize a meeting from a transcript***
Summarize this meeting. Detail action items that each participant needs to focus on.
[Josephine Vang] 13:01:13
Hi Justin, can you hear me?

[Justin Yeakel] 13:01:15
Again, how are you?

[Josephine Vang] 13:01:17
Good, how are you doing?

[Justin Yeakel] 13:01:19
I'm good, I'm good. I am trying to soak up the last. Little bit of free semester tranquility.

[Josephine Vang] 13:01:30
I bet. Okay.

[Justin Yeakel] 13:01:34
You're. I can hear you but your video looks like a fog.

[Josephine Vang] 13:01:40
Yeah, you know what? I don't know what happened to all my backgrounds. It's like it disappeared after the new year.

[Josephine Vang] 13:01:48
Okay. So I'm trying to, I'm trying to get it, well, okay, that'll do for Okay.

[Justin Yeakel] 13:01:49
Oh really?

[Justin Yeakel] 13:01:53
Oh, now I see some Christmas lights. There you go. Yeah. Oh, there you are.

[Justin Yeakel] 13:02:02
Yeah, maybe there was a zoom update.

[Josephine Vang] 13:02:02
Helping that's gonna work.

[Justin Yeakel] 13:02:08
Yeah.

[Josephine Vang] 13:02:10
Yeah, that's not gonna work. Okay.

[Justin Yeakel] 13:02:12
I haven't I don't use background so much because I have really frizzy hair and it doesn't the algorithm doesn't know how to cut around it.

[Josephine Vang] 13:02:21
Oh, I see. Yeah, okay. I'm going to have to fix this when we are done.

[Justin Yeakel] 13:02:22
Yeah.

[Josephine Vang] 13:02:30
All bummer because I had I had a bunch of pictures up there too or background. Anyways, okay.

[Justin Yeakel] 13:02:31
No.

[Justin Yeakel] 13:02:37
Yeah. Yeah. Happy New Year to you. Thanks for meeting with me.

[Josephine Vang] 13:02:39
You happy to hear?

[Josephine Vang] 13:02:43
No problem. Yes.

[Justin Yeakel] 13:02:47
Yeah, so I, give you the general Spiel in the email, but I was telling Betsy that, you know, we were having this all hands meeting and we were kind of like thinking about.

[Justin Yeakel] 13:02:59
How to structure it in a productive way and she was like, oh, you should talk to Josephine who's actually trained in these kinds of things.

[Josephine Vang] 13:03:10
Yeah, there's a few of us in SMS that have been trained in facilitation. So we've had some practice, you know, this past year, I've already helped applied math with one of their meetings and you know facilitating their discussions and you know facilitating their discussions you know the meetings and you know facilitating their discussions of you know the topic that they were talking about.

[Justin Yeakel] 13:03:10
And so I.

[Justin Yeakel] 13:03:30
Yeah. Yeah, and I guess, I mean, just to give you a sense of like what I'm hoping to get out of the.

[Josephine Vang] 13:03:30
So yeah.

[Justin Yeakel] 13:03:39
The all hands bio meeting so you know this is MCB and LES. So 2 different departments, most folks have, you know, worked together, but some people haven't and Definitely different perspectives on things.

[Josephine Vang] 13:03:44
Huh

[Justin Yeakel] 13:03:57
And what I've been really involved in since I took over this chair position for the bio program is thinking about how to.

[Justin Yeakel] 13:04:07
Build more departmental governance because the shared bio program. Nobody feels like it works well for anybody.

[Justin Yeakel] 13:04:19
It's, you know, It's a funny program because you know all the tools of governance are in the departments.

[Justin Yeakel] 13:04:28
But the, You know, the actual governance of the program is with the, you know, the bio program, which, which doesn't actually have any, any tools to do too much.

[Justin Yeakel] 13:04:40
And so one of the things that I've been focusing on is, you know, we have the new ecology major that is in review right now.

[Justin Yeakel] 13:04:48
Basically taking an emphasis track within the biology. Bs and turning that into a major and that's going to be governed entirely by the LES department.

[Justin Yeakel] 13:04:59
And then the hope is that MCB takes, you know, some of the emphases that are in the bio.

[Justin Yeakel] 13:05:07
S. And turn those into majors that are governed by the MCB department. And so kind of like begin.

[Justin Yeakel] 13:05:15
Separating out these different programs into their own majors that are more linear. And one of the big things that I've gotten general support for, but I don't really know how widely.

[Justin Yeakel] 13:05:30
People might share this, you know, this. This idea. Human biology is the biggest emphasis.

[Justin Yeakel] 13:05:38
Because people equate it with like med, you know, medical prep. However, There's very little that distinguishes the human biology track from any other track.

[Justin Yeakel] 13:05:49
So it's kind of false advertising. And one of the things that I would like to do that might be have some different perspectives is Take away that name and turn the human biology track into general biology.

[Justin Yeakel] 13:06:03
S. And to the general biology BS and that's the one that remains shared between the departments the other emphases become majors.

[Justin Yeakel] 13:06:13
And now we just have a single biology BS. A biology BA. Those are shared programs governed by.

[Justin Yeakel] 13:06:20
The current body of the biology program and then a whole bunch of other majors that are governed by the departments.

[Justin Yeakel] 13:06:26
And so that's the kind of discussion material that I'd like to. Explore at this all hands meeting.

[Josephine Vang] 13:06:27
Hmm.

[Justin Yeakel] 13:06:36
And yeah, and that's where I think, you know, there would be some clear.

[Justin Yeakel] 13:06:42
Things that would be helpful to have facilitated where, you know, there might be very different opinions and there might be very different.

[Justin Yeakel] 13:06:50
It's a big change. And there's lots of different stakeholders and some people have you know, kind of been in this program for a long time with.

[Justin Yeakel] 13:07:00
And perhaps help build it. And might be resistant to change and then other people are are newer and don't have that sense of ownership.

[Justin Yeakel] 13:07:14
Overall I think people are dissatisfied with the status quo so that might speak into, you know.

[Justin Yeakel] 13:07:20
Favor for for some kind of change but It's the discussion about change that I'd really like to.

[Justin Yeakel] 13:07:27
To explore.

[Josephine Vang] 13:07:29
Okay. Okay, so. So.

[Josephine Vang] 13:07:37
It looks like the attendees are going to be the Cormac, I'll see, of Elliott and FCB.

[Josephine Vang] 13:07:43
Right, so I was wondering if you know there were going to be any staff or grad students or anything like that.

[Josephine Vang] 13:07:50
You know anybody else in it but it sounds like it's just going to be strictly faculty.

[Justin Yeakel] 13:07:53
Faculty, I, I'd like to have the, The, oh.

[Justin Yeakel] 13:08:02
Counselors or the you know Okay, words are not coming out of my mouth. You know, the the folks that communicate with students and council students on the you know their pathways.

[Josephine Vang] 13:08:16
Oh, like the student advisors.

[Justin Yeakel] 13:08:18
Advisors is the word I was looking for. Yes, thank you. Sorry, I'd like to have them there too.

[Josephine Vang] 13:08:22
Okay, so the

[Josephine Vang] 13:08:25
Okay.

[Justin Yeakel] 13:08:26
They know the program better than any faculty do, including myself.

[Josephine Vang] 13:08:31
Okay, and the student. And would you have a list of those folks?

[Justin Yeakel] 13:08:35
I do. Yeah.

[Josephine Vang] 13:08:36
Okay, okay, I that's okay. I don't need them, but you would think that you would want them there to be involved in that conversation as well.

[Justin Yeakel] 13:08:45
Yes, I think so. I think they provide a grounding. You know, to some of the guest work.

[Josephine Vang] 13:08:52
Okay.

[Josephine Vang] 13:08:57
And the may really be there just to. Maybe clarify some information for faculty as opposed to like, joining the conversation.

[Josephine Vang] 13:09:09
To talk about how, how to change things up.

[Justin Yeakel] 13:09:11
I'm sure they will have some opinions about how potential changes will maybe impact pathways and you know.

[Josephine Vang] 13:09:23
Huh.

[Justin Yeakel] 13:09:25
Organization. They, I'm guessing they'll feel like you know the actual pathway itself though is something that the faculty will need to decide from my conversations with the advisors, but they will definitely have really, really.

[Justin Yeakel] 13:09:42
Really important insight into how conceived changes might you know, trickle down to affect things that we might not anticipate.

[Josephine Vang] 13:09:49
Okay, alright, and it sounds like the meeting is something that's already set. So the imitations already gone out, maybe we might need to add the student advisors into.

[Justin Yeakel] 13:09:59
I believe they've added, but that's something that I should really double check. Yeah.

[Josephine Vang] 13:10:03
Okay. Okay. And then, so, if I will be facilitating this, I'll also need a notetaker on the side and I will take care of you know, of any undertaker to join me that day.

[Justin Yeakel] 13:10:20
Okay, so Rita, we do have, you know, the new positions in our. Program.

[Justin Yeakel] 13:10:28
Rita Parks is. Was definitely on the list or she's helping organize the event and she takes notes for our departmental meetings.

[Justin Yeakel] 13:10:37
So she might, she might be a good candidate for that unless you had another thought.

[Josephine Vang] 13:10:37
Okay. Okay. Okay, sounds good. And then this is gonna be in the California room, so no zoom.

[Josephine Vang] 13:10:51
Everybody's in person. Bye.

[Justin Yeakel] 13:10:52
I have not said anything about Broadcasting it on zoom. And I guess I'm a little tentative about trying because everything I've read, if you do have a zoom option, zoom participants need to be just as engaged.

[Justin Yeakel] 13:11:07
Or have the same tools as in person attendees. And being someone who zooms a lot from home, I definitely have a sent, you know, align with that.

[Justin Yeakel] 13:11:21
But yeah, I guess I was a little. Daunted by potential technology challenges.

[Josephine Vang] 13:11:24
Yeah, I think that would be my concern too. And then, you know, the the engagement piece as well.

[Josephine Vang] 13:11:34
It would probably be best to have everybody attend in person. If at all possible.

[Justin Yeakel] 13:11:41
Yeah. Yeah, we might have. Might throughout maybe a late breaking zoom link like try to get everybody to plan to be there in person, but I would like to make it.

[Justin Yeakel] 13:11:54
Accessible. And so So I don't know if we do or if you are thinking like breakout room activities might be, you know, possible, you know, maybe we have one just for the Zoom people.

[Justin Yeakel] 13:12:10
And kind of treat them as like a separate table. I don't know if there, if there is a simple way of including them in that.

[Josephine Vang] 13:12:20
Yeah, I think, if we do do that, you know, just depending on what's decided, how, how we're gonna have it structured if we do do like, you know, a breakout then, you know, the attendees, the physical attendees will, you know, participate.

[Josephine Vang] 13:12:36
Amongst themselves and then the Zoom people will. You know, be another group. Right.

[Justin Yeakel] 13:12:39
Okay, I think I would like to I think I would like to try to plan to enable that we have an Alcam for our department, which is that 360 degree, camera.

[Josephine Vang] 13:12:45
Okay.

[Justin Yeakel] 13:12:54
And 3 60 degree microphone that that really enables good. You know, remote attendance to in person.

[Josephine Vang] 13:13:02
Huh. Okay. Okay, so, so if the zoom, option, is is given, then you, you or Rita or somebody else will help handle that part, right?

[Justin Yeakel] 13:13:18
Yeah, yeah, I'll have. Get on top of that.

[Josephine Vang] 13:13:22
Okay. And then the meeting is from 2 to 4. So you mentioned that about an hour, 15 to an hour, 30 min.

[Josephine Vang] 13:13:32
Of the facilitation, will the other 30 or 45 min be on other businesses or? Yeah.

[Justin Yeakel] 13:13:39
Yeah, I was gonna give like a 20 min Spiel at the beginning just kind of like.

[Justin Yeakel] 13:13:48
The state of things and you know just where things are at. I might mention some of the other business then.

[Josephine Vang] 13:13:53
Bye.

[Justin Yeakel] 13:13:56
And then have the bulk of the meeting and it doesn't have to be if it comfortably sit fits or if the things that we are thinking of are fit within an hour.

[Justin Yeakel] 13:14:06
Nobody's ever complained about a meeting that's doesn't last the entire 2 h window.

[Josephine Vang] 13:14:11
Right. Bye.

[Justin Yeakel] 13:14:12
I have 2 h block kind of set aside, but you know, if it's, if it's less than that, that's okay.

[Josephine Vang] 13:14:18
Okay.

[Justin Yeakel] 13:14:22
It's also first week of it's the first full week I guess of classes so people may have a shorter attention span or they have a lot on their plate.

[Josephine Vang] 13:14:28
Yes.

[Josephine Vang] 13:14:33
Hmm. Okay.

[Josephine Vang] 13:14:40
Okay, and then.

[Josephine Vang] 13:14:45
So for the meeting is this. It sounds like it'll just be a lot of it will just be gathering up ideas, right?

[Josephine Vang] 13:14:55
As opposed to you know gathering of ideas and making the decision at date. Right.

[Justin Yeakel] 13:15:01
Yeah, I think it's probably I mean from what I've looked at in terms of I've just been.

[Justin Yeakel] 13:15:07
I've been talking to Chat GPT about workshops. And based on what the robot told me, not having a decision, the pressure of making a decision will maybe free up people to interact and throw out ideas in a more creative way perhaps and then Cause I don't I don't really think there's there's not like a vote or a decision that is imminent.

[Justin Yeakel] 13:15:37
So we don't need to have any kind of pressure of like deciding on something, but. That that should be perhaps a future goal where we have a I have to think about what that would actually be because a lot of these A lot of these.

[Justin Yeakel] 13:15:53
Actions don't require a centralized vote, you know, a department can pose a major.

[Justin Yeakel] 13:16:01
It doesn't need the biology program to to be aligned with that or not. I guess the, I guess the big decision that would probably require a vote would be to turn human biology into the general track.

[Justin Yeakel] 13:16:19
For the BS. And that would mirror the general track for the BA. Which is on the other side of the review process now.

[Justin Yeakel] 13:16:32
So. And the governance body. For that track. Remaining with the biology program.

[Justin Yeakel] 13:16:40
Whereas the So I guess that would be something that would be good to. Just politically to have.

[Justin Yeakel] 13:16:48
You know, some sense of unification on or that folks are behind it.

[Josephine Vang] 13:16:53
Okay. And, Right, okay, so it's to kind of present that out there and then seeing what the general consensus is if everybody's in agreement or if somebody else.

[Justin Yeakel] 13:16:56
Or not.

[Josephine Vang] 13:17:09
Has maybe a different idea.

[Justin Yeakel] 13:17:12
Yeah, yeah, and there's certainly folks are gonna have ideas that we haven't thought about and maybe one of those are the better option.

[Josephine Vang] 13:17:21
Hmm. Okay. Okay.

[Josephine Vang] 13:17:28
While I look for a note-taker and I'll definitely reach out to Rita regarding that as well.

[Josephine Vang] 13:17:36
Why don't I will recommend that you maybe just write something, you know, just something really quick on, you know, with the overarching goal of this meeting with me, you know, what, what, what you envision the conversation and the participation to be about, what kind of decisions.

[Josephine Vang] 13:17:56
Not final decisions, but what kind of, what kind of ideas and themes you want to have come out of this meeting.

[Josephine Vang] 13:18:04
And then that way, you know, with that information, I will look into, you know, what we can do, how we construct the meeting to help these ideas.

[Josephine Vang] 13:18:15
Flow from people and you know them all to participate.

[Justin Yeakel] 13:18:19
Okay, yeah, that would be great. So, I should send that to you maybe first half of next week.

[Josephine Vang] 13:18:20
Okay.

[Josephine Vang] 13:18:26
Okay, yeah, that's fine and I should also mention that I am going to be out and for a few days the next couple of weeks.

[Josephine Vang] 13:18:34
So.

[Josephine Vang] 13:18:37
Wednesday and Friday next week I will be completely out. So 10 to 12 and then the fifteenth is a holiday so you know that days out.

[Justin Yeakel] 13:18:41
Okay.

[Josephine Vang] 13:18:48
Tuesday I'm also taking a vacation. So so Monday and Tuesday the fifteenth and sixteenth I will also be out.

[Justin Yeakel] 13:18:54
Okay.

[Josephine Vang] 13:18:55
So, if you can have it to me early next week, you know, in the meantime, I'll start to kind of generate some ideas too, so that, you know, I can be ready to go.

[Josephine Vang] 13:19:04
When did you send me that? Information and then when I come back on Thursday hopefully I'll have you know a little bit.

[Josephine Vang] 13:19:11
Some of my ideas, solidified on, you know, how to structure the meeting.

[Josephine Vang] 13:19:16
And then maybe we can. Touch back with with each other the week of the seventeenth.

[Justin Yeakel] 13:19:27
Huh.

[Josephine Vang] 13:19:28
1718, 19, just to, you know, talk about how, how would be structures like, you know, you're not surprised on the 20 s because.

[Josephine Vang] 13:19:36
Because it's the 20 s is gonna come really quick.

[Justin Yeakel] 13:19:38
Yeah, I know it's a little Like why didn't I give myself a little more leeway here?

[Josephine Vang] 13:19:44
Okay.

[Justin Yeakel] 13:19:46
No, that sounds great. And perhaps for that meeting, seventeenth, 1819, I'll invite Rita also and she can help with any of the like details.

[Justin Yeakel] 13:19:57
Like, you know, Alcam, you know, those kinds of things that might. Kind of just make it make it smoother.

[Josephine Vang] 13:20:03
Yeah.

[Justin Yeakel] 13:20:06
So I don't have to yeah the less kind of text stuff I have to worry about the more I can focus on the you know, the discussions.

[Josephine Vang] 13:20:06
Okay.

[Justin Yeakel] 13:20:13
Component. Okay.

[Josephine Vang] 13:20:13
Right. Yep, exactly. Yeah.

[Josephine Vang] 13:20:18
Okay, alright, sounds good. I'll wait to, see that email from you and then the meantime, I'll start to kind of generate some ideas.

[Josephine Vang] 13:20:26
And what we can do.

[Justin Yeakel] 13:20:27
Okay, excellent. Well, Justine, thank you so much for your help with this. I really, really appreciate it.

[Josephine Vang] 13:20:31
No problem. No problem

[Justin Yeakel] 13:20:34
Alright



***Summarize grant***

Here is our NSF grant. We need to write a 1 page summary with the following sections: Overview, Intellectual Merit, Broader Impacts. Each section should be 1 paragraph and together should fill one page. Use our language as much as possible, and keep it scientifically rigorous, nonflowery, and focus on the primary messages.

1 – Introduction, Questions, and Roadmap of the Proposed Research
1.1 – Introduction. Accelerating anthropogenic climate change and natural resource exploita- tion are pushing many ecological communities into novel states that do not have contempo- rary analogs1. These states are characterized by decreases in species richness, particularly of larger-bodied megafauna2, and declines in the density of species interactions3–5. In ma- rine ecosystems, three centuries of whaling and fishing – culminating in extreme recent over- exploitation – has greatly eroded the abundance of most larger-bodied species6.
A central challenge in mitigating these threats lies in anticipating how future ecosystems will respond and function7 as warming and exploitation change the species composition and size spectra of marine ecosystems8. To understand the future dynamics of these contempo- rary but highly perturbed ecosystems, it is necessary to understand the dynamics of ancient ecosystems, even in the distant past9. Our current understanding of ecological dynamics is based almost entirely on observations of contemporary communities10. Reconstructing the range of states occupied by oceanic communities in both the distant and historical past in- creases our fundamental understanding of the processes governing ecosystem structure and function11, and may enable anticipation of how future disturbances may alter ecosystems.
Such unique, no-analog, ecological communities must abide by the same metabolic rela- tionships governing the physiologies of species in contemporary biological systems, even if the resultant structure and functioning at the community-scale are very different1. Both ma- rine and terrestrial communities underwent deep reorganizations as Cenozoic climate change progressed12,13. The most significant shift in both marine and terrestrial climates occurred at the Eocene-Oligocene transition, ca. 34 myrs BP12,13. Ecological communities before and after this transition are thought to have been structured differently12, however these assessments are qualitative and often speculative. A prominent change during this time was the evolution of large-bodied baleen-equipped Mysticete whales, a potentially significant source of biomass for larger predators. A quantitative assessment of such reorganizations in community struc- ture and function is lacking, in no small part due to the absence of established mathematical methods needed to undertake such an task. Because the environmental conditions facing to- morrow’s ecological communities may closely resemble those of the early Cenozoic14, recon- struction of these systems may be vital for anticipating the states of future marine ecosystems.
1.2 – Questions. Our overarching objective is to establish a new mathematical framework that applies contemporary knowledge of the organismal bioenergetics to reconstruct population- level species interactions within past communities that have no modern analog. We will in- vestigate major changes impacting marine food webs across the Cenozoic (from 66 Myrs BP)
to develop and demonstrate this new framework. By assessing the dynamic limitations of species interactions from the bottom-up, while simultaneously reconstructing and informing structural constraints of the community, we aim to reconstruct and evaluate the response of ecosystems to past global change. We will address 3 primary questions:
Q1: Dynamics of motifs: Do species interactions predict specific body size con- straints shaping the nature of marine communities throughout the Cenozoic?
Q2: Dynamics of structure: How do the dynamics of size-structured species interac- tions provide insight into structural constraints of food webs?
Q3: Dynamics of food webs: How do the dynamic limitations of size-structured species interactions impact the stability of Cenozoic marine food webs?
 Fig 1: We will use specific and generalized mechanistic models of species interactions integrating allometric timescales to determine feasibility of motifs with short-chain (SC; few intermediary interactions) and long-chain (LC; many intermediary interactions) structures. Motif feasibility will inform structure of no-analog Cenozoic food webs, providing the basis for a special exhibit at the UAF Museum of the North. See text for details.
Here we propose a novel theoretical framework connecting the physiological constraints governing species’ life history to the structural and dynamical constraints of communities (see Fig. 1 for a schematic of our approach). By integrating mechanistic models of the physi- ological trade-offs constraining reproduction, ontogenetic growth, senescence, and mortality as a function of body size with tools from generalized dynamic modeling, we will show how the structure of bioenergetic flow through ecological systems underpins community structure and limits how these complex systems respond to large-scale disturbances. Conceptualizing the bioenergetic constraints governing ecological communities will allow us to reconstruct the dynamics and structure of representative no analog ecosystems at different snapshots across the Cenozoic. Our findings will have major implications for anticipating the effects of future climatic conditions on marine communities, while introducing a general framework useful for investigating a wide variety of ecological systems, including those in the distant past.
2 – Background, Intellectual Merit, & Novelty
2.1 – Metabolic drivers of populations and macroecological patterns. Organismal body size drives energetic demands across ontogenetic growth15, governing resource assimilation16,17 and by extension constraints on species interactions18. Energetic allocation to somatic growth and maintenance, and reproduction over the course of ontogenetic growth is ultimately lim- ited by an organism’s metabolic rate, which increases sublinearly with body size with expo- nent 3/419. This relationship, which is remarkably conserved across taxa – from bacteria to elephants – plays a significant role in determining life-history allometry, including reproduc- tive rate20, length of the juvenile period21, and physiological processes such as the rate of starvation and recovery22. Parameterizing the rate laws governing population dynamics us- ing allometric scaling relationships has proven extremely powerful in revealing the origins of macroecological patterns such as the mass-density relationship known as Damuth’s Law22–24 and constraints on species interactions25,26. These approaches are particularly well-suited for assessing macro-scale energetic limitations that govern the overall potential for particular

structural constraints within ecological communities, as well as their dynamic consequences.
2.2 – Marine food webs across the Cenozoic. Marine communities are distinctly different from terrestrial communities due to the physical properties of the medium in which they live. First, water has a heat capacity approximately 3200 times that of air and a heat conductivity ∼ 24 times greater. Marine communities are composed of mixtures of species utilizing endo-, ecto-, and mesothermic metabolisms27, however because heat loss is much more difficult to control, endothermic metabolism is generally relegated to the largest species. Second, buoy- ancy enables animals to evolve extreme size, while also serving to support a large amount of suspended biomass such that filter feeding strategies can support very large organisms, having independently evolved many times across vertebrates and invertebrates28–30. These characteristics play a significant role in structuring marine ecosystems, where only 1% to 0.01% of a system’s primary production reach the highest trophic levels, limiting resources available to apex predators31. Because filter feeding allows extremely large animals to feed near the bottom of the food web, these organisms tend to serve as important components of top predator diets, subsidizing their growth to extremely large body sizes32. These trophic short circuits, or short chain interactions, serve to pump large amounts of biomass to higher trophic levels in marine food webs, allowing for the evolution of super-sized predators32,33.
Marine environments changed markedly across the Cenozoic, with warm GreenHouse World environments (GHW; 66-34 Myrs BP) characterized by extensive shallow-water plat- forms and oligotrophic open-ocean ecosystems shifting to IceHouse World conditions (IHW; 34-0 Myrs BP) supporting marked polar ice growth and cooler sea surface temperatures (Fig. 1-VI)12. These different environments are thought to have supported divergent community structures characterized by uniquely different marine assemblages. GHW conditions sup- ported a diverse array of pelagic and reef fishes, but were driven by picophytoplankton- dominated primary production34. This has been conjectured to have led to much longer food chains than exist in contemporary systems, with the cumulative energy loss between trophic levels resulting in much smaller populations of apex predators.
The Eocene-Oligocene transition to IHW conditions 34 Myrs BP13 precipitated the diver- sification of marine mammals (both baleen and toothed whales, as well as seals) and many seabirds12. These IHW marine communities are thought to have been fueled by diatom- dominated food chains, which had fewer trophic levels and larger-bodied apex predators – such as Otodus megalodon – sustained by filter-feeding megafauna. While the GHW conditions lacked this large-bodied filter-feeding niche, it was filled exclusively by Mysticete whales during the IHW, occurring alongside the advent of a diverse and large-bodied apex predator community35. As a significant percentage of community biomass is tied to megafauna36, the evolution of baleen-equipped Mysticetes may have impacted the structure and function of oceanic communities. While some inference into food web structure across the various Ceno- zoic ecosystem states is possible37, little is known about the dynamical functioning of such no-analog communities, or the functional roles of species groups. Understanding whether and to what extent the evolution of large-bodied filter feeders and their potential predators impacted the structure and function of marine systems is of paramount importance for an- ticipating future ecosystem states. The tremendous impact of industrialized fishing over the past 300 years has decimated the populations of filter-feeding megafauna, potentially initi- ating cascading effects as apex predators such as killer whales have switched to smaller and less sustainable prey38.
2.3 – Intellectual merit. Understanding the dynamics of ecosystems in the geologic and his-

torical past compared to those today has both large implications for our understanding of the fundamental drivers of macroevolutionary and macroecological processes and for our ability to inform expectations of future responses to planetary-scale disturbances39. A wide variety of mathematical approaches have been developed to analyze the dynamics of contemporary communities, many of which involve the use of large comprehensive datasets40. Most re- cently, the integration of a large number of empirical measures of species interactions along with high-dimensional trait data (available for some well-studied modern ecosystems) has enabled the use of non-parametric machine learning approaches to predict the probability and magnitude that a pair of species will interact within a given assemblage41. While such approaches have been successfully leveraged to understand patterns of community collapse in relatively recent (e.g. Pleistocene) ecosystems42, they are less useful for reconstructing the nature of paleoecological communities that are compositionally unique. Thus, to analyze these past ecosystems such that they might inform current and future ecosystem states, we must first establish tools and frameworks that enable reconstruction of past dynamics.
2.4 – A novel framework for no-analog ecosystems. We propose an innovative framework aimed at unraveling the complex dynamics of no-analog communities, merging traditional approaches with recent advances in nonlinear dynamics, specifically leveraging generalized modeling 43,44 to interlace bioenergetic trade-offs — ubiquitous across macroscopic organisms — with population-level dynamics. This unique synthesis aims to pioneer a path for gener- ating important biological insights into the macroevolutionary processes shaping ecosystems through time. By focusing on the reconstruction of past ecological dynamics, our framework centering the use of allometric dynamics within motifs to inform feasible food web struc- tures from which community dynamics can be evaluated, pushes beyond traditional applied mathematics in community ecology, and promises to enhance the predictive power of eco- logical models and to deepen our comprehension of biological systems across scales. This framework is uniquely positioned to fill the gap in our tool-kit for studying ecosystems with no modern analog, employing a blend of theoretical insights and practical methodologies to address critical questions in ecology and evolution.
3 – Approach, Preliminary Results, and Predictions
3.0.1 – Consumer-resource interaction motif. We start with the assumption that the flow of energy within and between species’ populations is an important force in shaping the in- teractions within ecological communities, specifically by introducing large-scale constraints on body sizes. The core of our framework integrates the effects of individual reproduc- tion45, ontogenetic growth21, and mortality into a dynamic consumer-resource (C-R) frame- work24,46 (Fig. 1-IVa) established on mechanistic bioenergetic trade-offs21. Connecting these approaches enables us to evaluate the dynamic feasibility of specific ecological relationships22, such as resource limitation, competition, and predation. The energy available for somatic growth, maintenance, and reproduction for a consumer (C) is limited by its consumption of a resource (R) with growth rate α and carrying capacity k. The consumption rate is proportional to resource density and is given by λC(R)/YC, where λC(R) is the consumer growth rate and YC is the consumer yield coefficient, or g consumer produced per g resource consumed20.
Consumer mortality is the product of natural mortality μC and starvation, which is in- versely proportional to resource density σC(R) = σmax(1 − R/k)22, and mortality from pre-
C
dation b(C, P), where the predator density P is constant in this particular motif. Consumer-
resource dynamics then follow a Lotka-Volterra structure47, shown in in Fig. 1-I. The rate

laws describing resource consumption as well as consumer growth and mortality all vary as a function of consumer body mass MC, where the consumer is assumed to be a marine mammal consumer, and the resource is an unspecified prey with energy density Ed.
We approach the derivation of vital rates by solving for multiple timescales associated with
ontogenetic growth, maintenance, and expenditure. As such, attributes such as the percent-
age of mass carried as fat – which varies superlinearly with body size across mammals – can
have a large impact on mortality22,48. This approach differs from prior efforts by position-
ing our understanding of the timescales associated with reproduction and mortality on the
energetic trade-offs associated with somatic growth and maintenance across an organism’s
expected lifetime. This mechanistic perspective enables us to specify the timescales associ-
ated with individual-level processes from which vital rates are derived, where, for example,
the rate of mortality due to starvation is set by the timescale associated with metabolizing an
individual’s fat reserves from its maximum capacity22. Following this approach, the growth
of an individual consumer from birth mass m = m0 to its reproductive size m = 0.95MC
is given by the solution to the metabolic balance condition B0mz = Em dm + Bmm, where dt
Em is the energy needed to synthesize a unit of biomass, and Bm is the metabolic rate to support an existing unit of biomass. This condition is used to generate a closed form solu- tion capturing the ontogenetic growth of consumers from birth mass m0 to adult body size MC (Fig. 1-II), enabling direct calculation of timescales relating to growth and reproduction, starvation and recovery, and other sources of mortality as a function of body mass22,48,49.
3.0.2 – Macroecological verification: a ter-
restrial example. As a proof-of-concept,
we observe that our general framework can
make accurate predictions of steady state
densities when applied to a range of sys-
tems. If the rate laws in Eq. ?? are parameter-
ized to those of terrestrial herbivores (where
data quality is high), we observe that the
steady state densities of mammalian herbi-
vores (MC∗ ), varying in mass from 1 to 108 g,
predicts observed species’ population den-
sities, an empirical relationship known as
Damuth’s Law (blue line; Fig. 2A). There
are slightly exaggerated densities for small-
bodied consumers 23 , but well within the ob-
served range of variation. Incorporating nat-
ural variation of resource growth rates and carrying capacities50,51 reveals strong alignment between the predicted range and the observed variability of densities across mammalian clades (shaded region; Fig. 2).
The effects of starvation may be incorporated explicitly by including different physio- logical states of a consumer population in response to declining resource densities (Nutri- tional State Model; NSM22). Applied to terrestrial herbivores, our NSM approach produces more accurate predictions of Damuth’s Law by suppressing the expected densities of smaller species (red line; Fig. 2A). That this added complexity increases accuracy at small body sizes is due to the fact that starvation mortality is more significant for smaller organisms52,53.
We next use a generalized modeling framework to directly assess the role that these, and
related, physiological systems have on the stability of marine species interactions. We will demonstrate how we will expand this approach to illuminate structural constraints of species interactions, and to investigate community-scale dynamics. Using paleontological, historical, and modern data to inform and verify model predictions, our approach will allow us to ex- plore the likely structure and function of no-analog marine communities across the Cenozoic.
Q1: Dynamics of motifs: Do species interactions predict specific body size constraints shap- ing the nature of marine communities throughout the Cenozoic?
Trophic interactions are constrained by body size54–56, and large prey generally suffer mortality from large predators, though the nature of predator-prey mass relationships varies across communities57,58, organismal body size5,55,59–61, and may be driven by the optimiza- tion of handling time among predator consumers62. Aquatic predator consumers and their prey resources are typically gape-limited, meaning that the former tends to have larger body sizes than the latter58. Again using terrestrial herbivores and their predators as a proof-of- concept, our framework reveals the emergence of a dynamic instability at megaherbivore size classes (Fig. 2). Predator populations are thus able to withdraw sufficient biomass from prey to sustain themselves – without crashing the herbivore population – below a threshold size ofMC† =2.58×106g.Thisboundarymatchesthemaximumherbivoresizelimitobservedin contemporary terrestrial systems, at roughly the size of an elephant54.
Importantly, these results are conditional on the specific choice of functional relationships between interacting species. We aim to understand to what extent the observed dynamics are sensitive to changes in these functional relationships, or whether they may be general out- comes independent of functional architecture, while avoiding over-parameterization of past interactions that cannot be measured from observation. This requires us to build upon a re- cently developed set of theoretical approaches known as generalized modeling (GM)43,44,63,64, where the specific functional forms within a dynamic model are not specified. We next illus- trate the GM framework, and show how this approach can provide powerful insight into systems where the architecture of interactions is largely unknown.
3.1.1 – Generalized interactions & functional elasticities. A generalization of the specific consumer-resource system posed in Eq. ?? preserves the direction and dynamics of energetic flow through trophic levels, but does not assume knowledge of the functional forms. Showing only the consumer dimension for brevity, the generalized consumer dynamic is written
d C = G(R, C) − M(C) − S(R, C) − B(C). (1) dt
Here the function G describes the growth of the consumer, while the functions M, S, and B describe consumer mortality due to senescence, starvation, and predation, respectively. Because the steady states (denoted ∗) for a system of equations without assumed functional forms are unknown, we normalize the system to the unknown internal steady states, i.e. (R∗, C∗) > 0. We then introduce a set of normalized variables and functions, where variables are normalized as, for example, c = C/C∗ and functions as g(r, c) = G(R, C)/G(R∗, C∗). As a whole, normalized variables and functions from eq. 2 have the property that at steady state c = g(r, c) = m(c) = s(r, c) = b(c) = 1. Normalized consumer dynamics are rewritten

where αc = G(R∗, C∗)/C∗ is the scale parameter representing the characteristic timescale of the consumer population. We also define branching parameters β = 1 M(C∗ ) and δ = 1 − 1 B(C∗ ) ,
αc C∗ αc C∗ that denote the relative contributions of different sources of mortality for the consumer pop-
  ulation,whereβ ̄ =(1−β)andδ ̄=(1−δ).
Local stability is computed by linearizing the system around the steady state in ques-
tion. The result is the so-called Jacobian matrix J|∗ that captures the system’s response to perturbations in the vicinity of the steady state under consideration. For the generalized model one formally computes the linearization for all feasible steady states43. The lineariza- tion of the generalized functions are functional elasticities and thus directly interpretable bi- ologically as the percent change in growth or mortality with respect to a percent change in the resource or consumer density. For instance, the elasticity of consumer growth is given by ∂g(c)/∂c = ∂ log G/∂ log C|∗. Functional elasticities offer a number of advantages that are particularly useful for the analysis of systems where the functional architecture is not known, and this is especially true for no-analog species communities. An elasticity of a power-law function of the form F(X) = aXp is equal to p43, while for more complex functions the value of the elasticity may change with the value of the unknown steady state, but are bounded between a small range of values – typically 0-3 for most biological interactions44.
3.1.2 – The allometry of consumer elasticities. For the spe- a. cific system in Eq. ??, we observe that the functional elasticity
of consumer growth φ = ∂g/∂c = 1. However, if we assume
that the functional response describing consumer growth is not known, we can use a GM approach to evaluate the effect of the entire class of possible functions on the consumer mass thresh-
old MC† . We thus obtain direct insight into how changes in the nature of functional responses impact stability of the C-R in- teraction for differently-sized consumers. The consumer mass 0 threshold occurs at Det(J) = 0, where the elasticity of growth
where we understand that the elasticities are all evaluated with
10
Consumer Mass Threshold (g)
respect to the steady state. Applying the mass-specific steady
states of the known C-R system to Eq. 3, we find a nonlinear re-
lationship between the elasticity of consumer growth and the
consumer mass threshold MC† (Fig. 4A). First, we note that
φ = 1 at MC† = 2.58 × 106 g, which corresponds to the spe-
cific threshold in Fig. 2 and represents the maximum sustainable body mass for a terrestrial
of consumer growth with respect to consumer density φ = ∂g/∂c, and b. the functional elasticity of consumer predation mortality with respect to consumer density γ=∂b/∂c. φ,γ=1inthespe- cific C-R model (dashed lines).
mammal under the assumed environmental conditions. However we now also observe how changes to the functional elasticity of consumer growth will be expected to impact this mass threshold. Reducing the elasticity of consumer growth results in increasing the consumer mass threshold towards larger body sizes; increasing the elasticity lowers the mass threshold, and if the elasticity is increased far enough, is expected to introduce an additional threshold at very small body sizes – a phenomenon we otherwise only observe in higher-dimensional motifs (Fig. 1-V). So as the growth of the consumer population becomes less sensitive to changes in its density, the feasibility of dynamically stable megafauna is promoted, and this result is independent of our knowledge of the functional form governing consumer growth – showcasing the utility of combining the GM approach with allometric reasoning. We note that the very high elastic-
Fig 3: a. Body mass threshold MC† giventhefunctionalelasticity

ity values that result in very low mass thresholds imply that population growth is incredibly sensitive to the smallest changes in density, which in this context are not realistic, generally relegating the mass threshold to larger body sizes.
Using the same approach, we also evaluate the elasticity of predation of the consumer with respect to its density γ = ∂b/∂c, again equal to unity in the specific C-R system. Here we find an opposing pattern, which conforms to the opposing roles of the two functions with respect to consumer dynamics. As the elasticity of predation mortality increases from unity, the mass threshold is raised towards larger body sizes. As the elasticity decreases, the mass threshold is lowered towards smaller body sizes. So the inclusion of Type II (saturating) or Type III (sigmoidal) functional responses, accounting for predator handling time and prey refugia, respectfully and having elasticities > 1, would serve to promote the feasibility of megafauna by increasing the mass threshold. The generalized C-R model thus permits the investigation of interactions where the specific rate laws driving interactions remain unknown, required for reconstructing no-analog com- munities. We next describe our proposed theoretical extensions, and illustrate how empirical data can be used to both inform and verify model predictions.
3.1.3 – Proposed work: expanding theory. In §3.0.1 - 3.0.2, we demonstrated a proof-of- concept framework for the C-R motif parameterized from allometric timescales of growth and mortality applied to endothermic terrestrial mammals. To apply these methods to the dynamics of species interactions in marine communities, we must i) incorporate the ener- getic dynamics of marine species, including ecto-, endo-, and mesothermic metabolisms; ii) account for alternative allometric scaling relationships among marine species; iii) expand the range of motifs to include explicit competition, predation, and intraguild predation with both short-chain (SC) and long-chain (LC) interactions (Fig. 1-IV), capturing the unique short- circuiting introduced by large-bodied marine filter-feeders and their predators.
Metabolic machinery and allometric relationships in marine environments. We will modify the energetic dynamics and allometric relationships that we have shown for terres- trial mammals to account for those characteristic of marine species. First, we will examine the effects of different metabolisms on the dynamics of consumer-resource interactions. Ec- tothermic species, including most pelagic fishes, have body temperatures that are largely controlled by the environment, such that their energetic requirements tend to be lower65. This suppresses growth rates, especially in low temperature environments, while simulta- neously promoting fasting endurance and increasing lifespans66. In contrast, endothermic species such as marine mammals, have tightly regulated body temperatures requiring sig- nificantly higher energetic intake rates67. In the middle span a diverse array of mesotherms such as tuna and large sharks, with some, but not total, control of internal body temperatures, facilitating active hunting behaviors while retaining significant energetic efficiencies68. Im- portantly, large-bodied apex predators such as O. megalodon have been recently shown to be endothermic, likely demanding enormous energetic requirements69.
Second, the buoyancy provided by a marine environment will directly impact allomet- ric relationships governing energetic storage compared to terrestrial species70. For example, marine species will generally demonstrate heightened scaling exponents characterizing fat storage71, with large fish storing fat resources in their liver for both buoyancy and energetic reserves72, and whales storing fat as energetically dense blubber73. A higher fat-scaling expo- nent will lower starvation rates, suppressing mortality among larger species48, likely serving to increase the mass threshold MC† in the C-R model and aligning with expectations for in- creased feasibility of diverse marine megafaunal guilds. However a detailed assessment of these dynamics requires expanding the C-R perspective to the interaction motifs in Fig. 1-IV.

Expanding ensembles of motifs. We are expanding on the core trophic relationship il- lustrated in the C-R system from 3 to 6-species motifs to include: explicit predation (Fig. 1-IVb), competition and prey switching (Fig. 1-IVc), and the combination of these elements (Fig. 1-IVd,e) across a range of trophic levels and incorporating short-chain and long-chain interactions. While increased richness and interaction densities generally erode stability74, assessing how the elasticities of growth and mortality scale with body size given species’ po- sitions within motifs, and the trophic levels at which motifs are rooted, will shed light on the feasibility of alternative size-structured interactions. For instance, the inclusion of explicit predation and competition (Fig. 1-IVc) introduces a small-size threshold and a large-size threshold for the two consumer populations (example shown in Fig. 1-V). Importantly, this motif-centric approach will also allow us to directly explore the role of large-bodied filter feeders as they introduce short-chain interactions to the base of the food web, providing a niche for super-predators such as O. megalodon. Across motifs and parameter ranges, these threshold conditions will allow us to define the probability of interaction feasibility Pr(Fij) for species i and j, or the probability that two interacting species can maintain a positive pop- ulation size, which we will use to directly inform food web structure.
3.1.4 – Proposed work: confronting model predictions with isotopic data.
We will integrate dynamic models with empirical data informing species interactions dur- ing Eocene (ca. 56-34 Myrs BP), Oligocene (34-23 Myrs BP), Miocene-Pliocene (ca. 23-2 Myrs BP), and historical periods (Fig. 1-VI). Combined with collating published body size infor- mation, morphological measurements, and isotopic data for early whales, sharks, and fish from these time periods, we will leverage several recently funded NSF awards to PI Kim (#’s: 1830480, 1842049, and 2239981), utilizing collections of shark teeth from fossil deposits to gen- erate new body size estimates and isotopic data informing species interactions. During the Eocene, large apex predators and prey were absent from marine communities, with biomass concentrated at lower trophic levels12. Sand tiger sharks (Striatolamia macrota) were successful Eocene predators, leaving fossil teeth in sediments ranging from the Arctic to the Antarctic75. Having recently combined population models with fossil data to demonstrate the importance of Eocene nurseries76, we will utilize novel chemical proxies developed by PI Kim to estimate trophic levels of apex predators. Trophic level estimates from isotopic data will be used to directly inform the location of predator species within food webs, as well as biomass flow between potential prey. For example, a lower trophic level for large-bodied predators would accord with increased reliance on lower-trophic filter feeders and short-chained interactions, whereas a higher trophic level would indicate a more typical long-chain interaction. Eocene marine food webs had elongated trophic chains driven by a picophytoplankton-dominated productivity regime, warmer oceanic conditions12,77, and lacked large-bodied filter feeders. Understanding how the appearance of trophic short-circuits alongside baleen-equipped Mys- ticetes impacted the structure and function of post-Eocene IHW systems from those earlier may be key to anticipating the future effects of climate change.
The dominance of the largest-bodied apex predators was short-lived, with O. megalodon go- ing extinct in the late Pliocene78. Why these large sharks went extinct while the smaller white shark (Carcharodon carcharias) – a potential competitor – persists to the present day 79 remains a mystery. Recently, PI Kim developed zinc and enameloid-bound nitrogen isotopes as trophic level proxies to show that O. megalodon had high, but variable, trophic levels that overlapped with those of co-occurring white sharks, signaling competitive dynamics80,81(NSF #1830480). The observed trophic variability suggests that O. megalodon populations may have been char- acterized by high individuality, where some individuals specialized in lower-trophic filter-

feeders while others specialized in higher-trophic mesopredators. We will integrate this pa- leoecological information into our motif framework to directly examine the constraints of narrow vs. variable trophic levels (i.e., specialist vs. generalist diets) for competing species at these size classes, and determine whether the larger O. megalodon may have been predis- posed to extinction as a consequence of instabilities arising from bioenergetic flow. Together, the coupling of dynamic models developed in RISE with the paleoecological inference de- veloped in PI Kim’s group will represent a major advance towards connecting physiological constraints of populations with structural constraints of communities, while also resolving the role of bottom-up, top-down, and interactive controls on marine food webs.
Q2: Dynamics of structure: How do the dynamics of size-structured species interactions provide insight into structural constraints of food webs?
The structure of species interactions within ecological communities is often measured and evaluated separately from the dynamics82. For instance, the construction of a food web typ- ically assumes observed interactions between species83, or assumes a structural model from which an ensemble of potential food webs can be drawn84. Because body size is a major de- terminant of antagonistic interactions between individuals of different species, it often plays a central role in driving trophic structure40. And because body size also sets the constraints governing biomass flow46,65, treating structure and dynamics separately misses the dynamic feedback that inherently exists between the two.
We will approach the question of structure from an alternative direction: using our motif- scale analysis of species interactions in Q1, where rate laws are derived from energetic trade offs as a function of body size between a small number of species, we aim to inform the prob- ability that species i and j interact by integrating the dynamic feasibility of the interaction Fij. The framework that we describe below is thus designed to incorporate both contem- porary understandings of species interactions with the predicted dynamic feasibility derived from mechanistic constraints governing the flow of biomass between interacting populations.
3.2.1 – Proposed work: Predicting structure from dynamics. Trophic interactions in marine systems are tightly constrained by body size, such that the mean body size and range of potential prey increases with that of the consumer85,86. We will use the Latent Trait framework to establish prior probabilities describing the likelihood that a trophic link exists between a predator i and prey j, Pr(lij = 1), given the body mass ratio Mj/Mi87. This requires a set of unknown parameters to be fitted to known interactions between species of different body sizes based on contemporary observations87–89. This approach yields a set of body size rules determining the probabilities of pairwise interactions that can be employed to construct an ensemble of probable food web structures5.
Importantly, the interaction structures emerging from Latent Trait-derived link probabili- ties necessarily reflect the properties of the contemporary systems on which they are fitted. Because contemporary food webs are unlikely to be representative of either past Cenozoic states or future states likely to emerge from the cumulative effects of over-fishing and climate change, we suggest that informing these interaction probabilities with a process-based assess- ment of feasibility will highlight interactions that are either unrealized but bioenergetically feasible, and/or realized but bioenergetically infeasible. The probability of dynamic feasibil- ity Pr(Fij) between species i and j can then be more specifically defined as the probability that two interacting species maintain viable population densities across a range of defined conditions, including: i) measured ranges for specific parameter values (e.g. productivity), ii) ranges of interaction strengths across alternative motif structures, and/or iii) values of func-

tional elasticities (e.g. Fig. 4), which capture variance in feasibility across classes of models.
 For example, we have shown
that a consumer-resource (C-R) in-
teraction is feasible if MC < MC†
(Fig. 2), but that the size thresh-
old varies across elasticities of con-
sumer growth φ and mortality γ.
Allowing growth and mortality
elasticities to vary uniformly across
their known values – where φ ∈
(0,2) and γ ∈ (1,2) – we ob-
tain an estimate for the probabil-
ity a given consumer mass MC <
MC† across these ranges. For other
interactions that involve multiple
consumers and/or higher trophic
predators, feasibility is more complex and constrained by both lower and upper bounds as- signed to different species within the motif. Having calculated the likelihood of dynamic feasibility L (Fij) based on mechanistic constraints to bioenergetic flow across the range of possible motifs for a pair of interacting species, we can then update the interaction probability, where P(lij|Fij) ∝ L (Fij|lij)P(lij). Informing structure from interaction feasibility will en- able bioenergetic feasibility to directly guide the reconstruction of food webs that may have occupied different states than those observed today. For marine communities during time periods closer to the recent, where species compositions are similar to today’s (e.g. historical communities; see §3.3.3), contemporary community structure may be expected to be maxi- mally informative. Yet, if our goal is to understand the potential structure of more ancient no-analog systems, the feasibility endowed by sustainable bioenergetic flow in a particular community assemblage may be expected to better capture known constraints.
Q3: Dynamics of food webs: How do the dynamic limitations of size-structured species interactions impact the stability of Cenozoic marine food webs?
We next expand our notion of species interaction motifs to complex ecological food webs. Our GM approach can be directly adapted to account for complex and interconnected in- teractions between species5,43,63,90, where the derived elasticities and their associated ranges determine stability. By understanding how elasticities change with species body size in a food web context – for example as a function of trophic level – we aim to understand how the energetic trade offs associated with size limit or promote the feasibility of species interactions.
3.3.1 – Extending the allometry of elasticities to a food web framework.
It is straightforward to extend the generalized consumer-resource interaction to larger communities of interacting species63. We next describe the dynamics of an N species food
N
X ̇i =Fi(Xi)+ηiGi(X1,...,XN)−Mi(Xi)− ∑Bn,i(X1,...,XN) (4)
n=1
for i = 1...N, where ηi is the transfer efficiency of predator growth from prey consumption;
and Fi, Gi, Mi, and Bn,i are unspecified functions that respectively describe the growth of
web with N equations of the form
Fig 4:
at different scales with dimensionality D. (a) Metabolic constants. (b) Allometric relationships. (c) Community assemblage data. (d) Isotope system 1. (e) Isotope system 2. (f) Contemporary food web structure. (g) Contemporary eco-morphological trait data.
Informing the general no-analog framework with data

species i by primary production, the growth of species i by predation, the loss of species i due to natural mortality, and the loss of species i due to predation by species n. We thereby obtain a Jacobian matrix J that captures the dynamical stability of every steady state in the whole class of models under consideration, as a function of scale, branching, and elasticity param- eters that each have a limited range of biologically reasonable values5,91. Given an ensemble of potential food web structures, the probability that this generalized system is stable is cal- culated by drawing randomly from distributions representing the range of possible values for parameters characterizing Jacobian on- and off-diagonal elements. Because the known parameter ranges are well-defined5,63, the proportion of systems that are stable denotes the probability of randomly drawing a stable network given reasonable assumptions on the in- teractions, providing a measure of the structural robustness the community.
3.3.2 – Proposed work: size-structured feasibilities within food webs. As we have shown in the previous section, the values of particular functional elasticities are expected to vary with species’ body size. Because communities of interacting species are largely structured by body size – and in marine systems body size tends to increase with trophic level with some notable exceptions – the allometric influence on the potential values of particular functional elasticities may impart a strong signature on system structure and dynamics.
With the changing nature of Cenozoic marine communities, from picophytoplankton-rooted food webs prior to 34 Myrs BP to diatom-rooted food webs with diverse marine mammal clades after 34 Myrs BP, the starkly contrasting species compositions and their associated size distributions are expected to have contributed to very different food web structures that may have functioned very differently. Using insights into dynamical constraints on structure that we obtain from §3.1.3 and §3.2.1, we will construct ensembles of food web networks that represent energetically feasible species interactions during the Eocene, Miocene, as well as during historical and recent periods (Fig. 1-VI). By integrating allometric constraints on func- tional elasticities into the Jacobian obtained from the generalized food web model (Eq. 4), we will directly assess the stability of marine communities in states across the Cenozoic.
In addition to system-level stability, we will use the generalized Jacobian matrix J to assess species-level sensitivities to external disturbances. The sensitivity of each species i to changes
in the community steady state (Sei)92 is defined as Sei where λk is the i
kth eigenvalue of the Jacobian matrix (λ−1 is the kth eigenvalue of the impact matrix I, where k
I = J−1) and v(k) is the corresponding right eigenvector. This sensitivity quantifies the mag- nitude of species i’s expected response to long-term changes and thus provides a dynamic measure of the structural resilience of species. The PIs used a similar approach to show that species’ sensitivities is predictive of temporal persistence in both historical and contemporary mammalian food webs5. For example, we aim to directly evaluate the potential competition between Miocene white sharks and O. megalodon (§3.1.4) by assessing the sensitivities of each species with respect to the bioenergetics and derived allometry of functional elasticities. In this case, an elevated elasticity for O. megalodon, perhaps as a function of alternative dietary relationships, would correlate with the comparatively long persistence of great whites.
3.3.3 – Proposed work: Confronting model predictions with historical data in the North- west Atlantic. The reorganization of marine communities after 34 Myrs BP was in large part a consequence of changing environmental conditions as well as the diversification of marine mammals – a fundamental component of ocean food webs up to and including modern times. However the last 500 years have witnessed intensification of industrialized fishing and whal-

ing, reducing the populations of these keystone species6. We propose to harness the tools described in the previous sections to understand whether and to what extent the effects of these anthropogenic pressures have changed the nature of marine communities, and whether further pressures may drive systems into states that may or may not have a paleontologi- cal analog. The Northwest Atlantic (NWA) includes the broad continental shelves of eastern North America including George’s Bank, the Gulf of Maine, the Scotian Shelf, the Gulf of St. Lawrence, and Grand Banks, and historically represent some of the most productive and heavily exploited marine ecosystems on Earth. The NWA ecosystem is a useful case study be- cause it did not exist until the recession of ice sheets at the end of the Pleistocene, providing a constrained timeline of study.
Approximately 20 kyBP, and for many tens of thousands of years prior, the Laurentide Ice Sheet covered the entire spatial domain of what is now the NWA marine ecosystem. Signifi- cant retreat began ∼18 kyBP, and by 15 kyBP the outer margins of the Scotian Shelf, George’s Bank, and Grand Banks became exposed, with the warm stable Holocene conditions we see today prevailing after 11 kyBP93,94. By 8 kyBP, the physiography of the system looked approx- imately as it does today94. Population reconstructions using historical records have shown that many marine populations in the NWA, including whales95,96, sharks97–100, seals101,102, cod103, demersal, reef, and other fishes104,105, and benthic invertebrates106 were historically much larger than today. Following European settlement, steady technological improvement ratcheted up fishing and hunting pressure and increasingly altered the system through the historical period. Walrus and seals were the first taxa to be significantly depleted; breed- ing on land and sea ice made them especially vulnerable101,107–110. Whales were likely the next taxa significantly reduced6,95, followed by the depletion of halibut111 beginning in the mid 19th century. The depletion of demersal fishes and sharks followed, with the advent of long-lining and trawling technologies in the mid 20th century97,112–114.
Using curated empirical data of trophic interactions and body mass ratios in contempo- rary marine food webs, we obtain maximum likelihood estimates for species interactions in modern systems, Pr(lij = 1|Mi, Mj). This relationship allows the construction of an ensemble of potential food web structures that reflect these probabilities, an example of which is shown in Fig. 1-VII (bottom). For contemporary systems, this fitted relationship results in an accu- racy of ca. 74% with respect to predicting both link presence and absence. We anticipate that updating Pr(lij) with dynamic feasibility Fij will improve estimates of food web structure, increasing the probabilities of bioenergetically feasible interactions that may not be captured by direct correlations with body size ratios alone.
Historical structure without dynamic feasibility. While there are certainly species-specific and regional idiosyncrasies that differentiate marine trophic structure, we observe that the broad strokes of these structures can be anticipated from body size ratios55,115. Because his- torical communities had very similar species assemblages, we can use the same mass-specific link probabilities – in addition to the presence/absence of species in the NWA at different temporal snapshots and their known body sizes – to evaluate changes in NWA food web structure over time. In Fig. 1-VII (top) we show an example of a reconstructed NWA food web with species compositions representative of ca. 1700 AD, which is distinguished from the current NWA system by the inclusion of 6 higher trophic-level species, since lost. Recalling that both historical and current food web depictions in Fig. 1-VII are but single realizations of a large ensemble, we observe important differences, including a reduced mean maximum trophic level of the community in 2000 compared to 1700 (across 5000 replicates) from 3.32 to 2.95, despite no change in trophic link density (i.e. connectance).
Many of the most important relationships between species in food webs are indirect116,117,

where, for example, two disconnected consumers may be indirectly linked by resource com- petition. We assessed the total number of pathways of lengths 2 and 3 connecting species in reconstructed NWA food webs for years 1700 and 2000 (Fig. 1-VII)118,119 and find that the system in 1700 had many more indirect pathways connecting species than in 2000, even when controlling for changes in species richness and link density. A higher number of indi- rect paths suggests that disturbances may be more easily communicated across the network via competition. While the change in indirect pathways from 1700 to 2000 is a strong indicator that ecosystem dynamics and functioning have been altered, integrating dynamic feasibility and assessing stability using functional elasticities that vary allometrically, will enable a full accounting of the changes wrought by 300 years of industrialized fishing and whaling.
4 – Broader Impacts
4.1 – General insight into community structure and function. Using bioenergetic constraints to inform no-analog communities from both generalized and specific frameworks has re- ceived little to no theoretical attention. Because our approach is rooted in fundamental en- ergetic trade offs, it can be broadly extended to communities past and present, from pre- Cenozoic timescales to communities under future climate scenarios yet to be experienced. Our theoretical framework will leverage empirical stable isotope analysis of fossil material and body size reconstructions from NSFs #1842049, 1830480, and 2239981 to S. Kim.
4.2 – Graduate and postdoctoral practical training. This award will support 2 graduate re- searcher (GR) positions at UCM, a minority-majority certified Hispanic Serving Institution, and UAF. The UCM GR will contribute to the design of the food web framework, interface with the UAF GR, and improve statistical approaches for comparing interaction structures with observed food webs. The UAF GR will help design the dynamic analysis for smaller motifs and in particular engage in the database curation and theoretical frameworks for re- constructed historical food webs. Both GRs will report research results at professional con- ferences, contributing to 2-3 manuscripts during years 2-3.
4.3 – Museum exhibits to promote scientific engagement and learning. We will collaborate with the University of Alaska Museum of the North (UAMN) to construct an exhibit based on reconstructions of marine food webs throughout the Cenozoic (see Letter of Collaboration from UAMN curator Dr. Patrick Druckenmiller). The exhibit will showcase the changes in the ocean ecosystem over time and the impact of human activity on marine life during the historical period, utilizing the research collections at the museum, amounting to a total holdings of over 2.5M objects. This exhibit will be designed to connect multiple museum collections, integrating historical hunting objects used by Alaskan Indigenous communities to harvest marine resources, Indigenous art depicting the use of marine resources, and the largest marine mammal collection in the world, overseen by the Mammalogy Collection. The development of this exhibit will be roughly timed to coincide with the 100th anniversary of the UAMN, potentially adding to community engagement and public interest.
5 – Project timeline & management
This project will run three years. PI Yeakel will be responsible for overall project execution and coordination of individual project elements with co-PIs at UCM, UAF, and UAMN. PI Yeakel will oversee the development of the theoretical aspects of the project, working di- rectly with co-PIs Kim and Breed to integrate and connect paleoecological and historical data sources and food web models. See Fig. 5 for subject focus and planned publication schedules for the UCM and UAF research groups. To coordinate across-project progress, week-long
 Fig 5: Project timeline and management. Project manuscript objectives are denoted by open circles; broader impacts objectives are denoted by open diamonds. PI-Y, PI-K, and PI-B denote PIs Yeakel, Kim, and Breed, respectively. GS-UCM and GS-UAK denote UCM and UAK graduate students, respectively.
group meetings will be held annually, where all PIs and graduate students will work in per- son to coordinate and balance efforts across the project objectives. PIs will also hold quarterly teleconference meetings to coordinate and ensure progress across project objectives. The es- tablishment of the special exhib•it at UAMN will occur during year 3.
Results from prior NSF funding. J.D. Yeakel: NSF-SGP #1623852 (2016-2020; Co-PI J.D. Yeakel). Collaborative Research: Assessing millennial scale community dynamics using highly resolved mammal and vegetation food webs ($431,800). IM: We integrated recently discov- ered small mammal fossil material and vegetation into La Brea food web models prior to the Last Glacial Maximum, showing community niche variation responding to climatic trends. BI: This grant funded 1 Ph.D. student in Yeakel’s lab for 2 years. Two student-led publica- tions are in review, while the larger project has led to Refs 120–124. S. L. Kim NSF-OPP: #1842049 (2019-2022; PI S. Kim). Collaborative Research: Integrating Eocene Shark Paleoe- cology and Climate Modeling to Reveal Southern Ocean Circulation and Antarctic Glaciation ($297,395). IM: We explore the linkages between shark paleobiology, ocean circulation, and climate change during the Eocene when the Drake Passage was in the early phases of opening. Initial results indicate stable ecological and environmental conditions for sand tiger sharks despite the earliest geochemical evidence of water exchange75. A comparison of body size distributions from Eocene localities spanning latitudes demonstrated the importance of nurs- eries and migration76. The next phases delve into shark community changes and develops a climate simulation with bathymetry parameters and geochemical tracers. BI: Two PhD and two UGs are supported. A 2-week virtual workshop spanning shark ecology, oceanography, and geological time was delivered with CalTeach. G.A. Breed: NSF-IOS #2113466 (10/2021- 9/2024, $404,000; PI G.A. Breed). Collaborative Research: Predator facilitation across variable marine environments BI: This grant is currently supporting a female Ph.D. student and is pro- viding research opportunities to several undergraduate research assistants. Additionally, we are working closely with NOAA, USFWS, and NGOs to inform and develop conservation and fisheries management policies for the Tropical Pacific ocean. IM: This project is working to understand predator facilitation interactions between tropical seabirds and pelagic tuna & sharks, an important but overlooked ecological interaction potentially critical to the survival of millions of seabirds, using a suite of novel biologging tools and analytical approaches. The project has been running a little more than year; and we completed our first, and extremely successful, field season in December 2022. Results so far confirm the hypothesized impor- tance of tuna and sharks to the foraging success in seabirds, and were presented at the Pacific Seabird Group’s annual meeting in Feb 2023 by the Ph.D. student this grant supports.


