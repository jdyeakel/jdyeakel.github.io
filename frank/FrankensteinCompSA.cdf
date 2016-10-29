(* Content-type: application/vnd.wolfram.cdf.text *)

(*** Wolfram CDF File ***)
(* http://www.wolfram.com/cdf *)

(* CreatedBy='Mathematica 10.0' *)

(*************************************************************************)
(*                                                                       *)
(*  The Mathematica License under which this file was created prohibits  *)
(*  restricting third parties in receipt of this file from republishing  *)
(*  or redistributing it by any means, including but not limited to      *)
(*  rights management or terms of use, without the express consent of    *)
(*  Wolfram Research, Inc. For additional information concerning CDF     *)
(*  licensing and redistribution see:                                    *)
(*                                                                       *)
(*        www.wolfram.com/cdf/adopting-cdf/licensing-options.html        *)
(*                                                                       *)
(*************************************************************************)

(*CacheID: 234*)
(* Internal cache information:
NotebookFileLineBreakTest
NotebookFileLineBreakTest
NotebookDataPosition[      1064,         20]
NotebookDataLength[     22233,        552]
NotebookOptionsPosition[     22692,        543]
NotebookOutlinePosition[     23142,        563]
CellTagsIndexPosition[     23099,        560]
WindowFrame->Normal*)

(* Beginning of Notebook Content *)
Notebook[{

Cell[CellGroupData[{
Cell[BoxData[
 RowBox[{"Manipulate", "[", "\[IndentingNewLine]", 
  RowBox[{
   RowBox[{
    RowBox[{"Off", "[", 
     RowBox[{"InterpolatingFunction", "::", "dmval"}], "]"}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"CompDynStart", "[", 
      RowBox[{
      "rh_", ",", "rm_", ",", "ahm_", ",", "c_", ",", "k1_", ",", 
       "InitialHPower_", ",", "T_"}], "]"}], " ", ":=", "\[IndentingNewLine]",
      "\[IndentingNewLine]", 
     RowBox[{"NDSolve", "[", 
      RowBox[{
       RowBox[{"{", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{
          RowBox[{
           RowBox[{"H", "'"}], "[", "t", "]"}], " ", "\[Equal]", 
          RowBox[{"rh", "*", 
           RowBox[{"H", "[", "t", "]"}], "*", 
           RowBox[{"(", 
            RowBox[{"1", "-", 
             FractionBox[
              RowBox[{
               RowBox[{"H", "[", "t", "]"}], "+", 
               RowBox[{"ahm", "*", 
                RowBox[{"M", "[", "t", "]"}]}]}], "k1"]}], ")"}]}]}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{
           RowBox[{"M", "'"}], "[", "t", "]"}], " ", "\[Equal]", 
          RowBox[{"rm", "*", 
           RowBox[{"M", "[", "t", "]"}], "*", 
           RowBox[{"(", 
            RowBox[{"1", "-", 
             FractionBox[
              RowBox[{
               RowBox[{"M", "[", "t", "]"}], "+", 
               RowBox[{
                RowBox[{"(", 
                 FractionBox["ahm", "c"], ")"}], "*", 
                RowBox[{"H", "[", "t", "]"}]}]}], "k1"]}], ")"}]}]}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"H", "[", "0", "]"}], "\[Equal]", 
          RowBox[{"10", "^", "InitialHPower"}]}], ",", 
         RowBox[{
          RowBox[{"M", "[", "0", "]"}], "\[Equal]", "2"}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{"WhenEvent", "[", "\[IndentingNewLine]", 
          RowBox[{
           RowBox[{
            RowBox[{"M", "[", "t", "]"}], "\[Equal]", 
            RowBox[{"0.9", "*", 
             RowBox[{"(", "k1", ")"}]}]}], ",", "\[IndentingNewLine]", 
           RowBox[{
            RowBox[{"end", "=", "t"}], ";", "\[IndentingNewLine]", 
            RowBox[{"Hend", " ", "=", " ", 
             RowBox[{"H", "[", "t", "]"}]}], ";", "\[IndentingNewLine]", 
            RowBox[{"Mend", " ", "=", " ", 
             RowBox[{"M", "[", "t", "]"}]}], ";", "\[IndentingNewLine]", 
            "\"\<StopIntegration\>\""}]}], "\[IndentingNewLine]", "]"}]}], 
        "\[IndentingNewLine]", "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"H", ",", "M"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"t", ",", "0", ",", "T"}], "}"}], ",", 
       RowBox[{"MaxSteps", "\[Rule]", "Infinity"}], ",", 
       RowBox[{"InterpolationOrder", "\[Rule]", "All"}]}], "]"}]}], ";", 
    "\[IndentingNewLine]", 
    RowBox[{
     RowBox[{"CompDynEnd", "[", 
      RowBox[{
      "rh_", ",", "rm_", ",", "ahm_", ",", "c_", ",", "k2_", ",", "T_", ",", 
       "Mstart_", ",", "Tstart_"}], "]"}], " ", ":=", "\[IndentingNewLine]", 
     "\[IndentingNewLine]", 
     RowBox[{"NDSolve", "[", 
      RowBox[{
       RowBox[{"{", "\[IndentingNewLine]", 
        RowBox[{
         RowBox[{
          RowBox[{
           RowBox[{"H", "'"}], "[", "t", "]"}], " ", "\[Equal]", 
          RowBox[{"rh", "*", 
           RowBox[{"H", "[", "t", "]"}], "*", 
           RowBox[{"(", 
            RowBox[{"1", "-", 
             FractionBox[
              RowBox[{
               RowBox[{"H", "[", "t", "]"}], "+", 
               RowBox[{"ahm", "*", 
                RowBox[{"M", "[", "t", "]"}]}]}], "k2"]}], ")"}]}]}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{
           RowBox[{"M", "'"}], "[", "t", "]"}], " ", "\[Equal]", 
          RowBox[{"rm", "*", 
           RowBox[{"M", "[", "t", "]"}], "*", 
           RowBox[{"(", 
            RowBox[{"1", "-", 
             FractionBox[
              RowBox[{
               RowBox[{"M", "[", "t", "]"}], "+", 
               RowBox[{
                RowBox[{"(", 
                 FractionBox["ahm", "c"], ")"}], "*", 
                RowBox[{"H", "[", "t", "]"}]}]}], "k2"]}], ")"}]}]}], ",", 
         "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"H", "[", "Tstart", "]"}], "\[Equal]", 
          RowBox[{"10", "*", 
           RowBox[{"10", "^", "9"}]}]}], ",", 
         RowBox[{
          RowBox[{"M", "[", "Tstart", "]"}], "\[Equal]", "Mstart"}]}], 
        "\[IndentingNewLine]", "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"H", ",", "M"}], "}"}], ",", 
       RowBox[{"{", 
        RowBox[{"t", ",", "Tstart", ",", "T"}], "}"}], ",", 
       RowBox[{"MaxSteps", "\[Rule]", "Infinity"}], ",", 
       RowBox[{"InterpolationOrder", "\[Rule]", "All"}]}], "]"}]}], ";", 
    "\[IndentingNewLine]", "\[IndentingNewLine]", 
    RowBox[{"With", "[", 
     RowBox[{
      RowBox[{"{", 
       RowBox[{
        RowBox[{"rh", "=", "0.0067"}], ",", 
        RowBox[{"rm", "=", 
         RowBox[{"0.0067", "*", "1.5"}]}], ",", 
        RowBox[{"ahm", "=", "8"}], ",", 
        RowBox[{"c", "=", "10"}], ",", 
        RowBox[{"InitialHPower", "=", "IH"}], ",", 
        RowBox[{"k1", "=", "K1"}], ",", 
        RowBox[{"k2", "=", 
         RowBox[{"10", "*", 
          RowBox[{"10", "^", "9"}]}]}], ",", 
        RowBox[{"T", "=", 
         RowBox[{"10", "^", "4"}]}], ",", 
        RowBox[{"Mstart", "=", "Mend"}], ",", 
        RowBox[{"Tstart", "=", "end"}]}], "}"}], ",", "\[IndentingNewLine]", 
      RowBox[{
       RowBox[{"Quiet", "[", 
        RowBox[{"Traj1", "=", 
         RowBox[{"Evaluate", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"H", "[", "t", "]"}], ",", 
             RowBox[{"M", "[", "t", "]"}]}], "}"}], "/.", 
           RowBox[{"CompDynStart", "[", 
            RowBox[{
            "rh", ",", "rm", ",", "ahm", ",", "c", ",", "k1", ",", 
             "InitialHPower", ",", "T"}], "]"}]}], " ", "]"}]}], "]"}], ";", 
       "\[IndentingNewLine]", 
       RowBox[{"Quiet", "[", 
        RowBox[{"Traj2", "=", 
         RowBox[{"Evaluate", "[", 
          RowBox[{
           RowBox[{"{", 
            RowBox[{
             RowBox[{"H", "[", "t", "]"}], ",", 
             RowBox[{"M", "[", "t", "]"}]}], "}"}], "/.", 
           RowBox[{"CompDynEnd", "[", 
            RowBox[{
            "rh", ",", "rm", ",", "ahm", ",", "c", ",", "k2", ",", "T", ",", 
             "Mstart", ",", "Tstart"}], "]"}]}], " ", "]"}]}], "]"}], ";", 
       "\[IndentingNewLine]", 
       RowBox[{"Show", "[", 
        RowBox[{"{", "\[IndentingNewLine]", 
         RowBox[{
          RowBox[{"LogPlot", "[", 
           RowBox[{"Traj1", ",", 
            RowBox[{"{", 
             RowBox[{"t", ",", "0", ",", "end"}], "}"}], ",", 
            RowBox[{"PlotRange", "\[Rule]", 
             RowBox[{"{", 
              RowBox[{
               RowBox[{"{", 
                RowBox[{"0", ",", "T"}], "}"}], ",", 
               RowBox[{"{", 
                RowBox[{"1", ",", 
                 RowBox[{"10", "*", 
                  RowBox[{"10", "^", "12"}]}]}], "}"}]}], "}"}]}], ",", 
            RowBox[{"AspectRatio", "\[Rule]", "1"}], ",", 
            RowBox[{"Frame", "\[Rule]", "True"}], ",", 
            RowBox[{"FrameLabel", "\[Rule]", 
             RowBox[{"{", 
              RowBox[{
              "\"\<Years after 1816\>\"", ",", "\"\<Population size\>\""}], 
              "}"}]}], ",", 
            RowBox[{"PlotStyle", "\[Rule]", 
             RowBox[{"{", 
              RowBox[{
               RowBox[{"ColorData", "[", 
                RowBox[{"97", ",", "1"}], "]"}], ",", 
               RowBox[{"ColorData", "[", 
                RowBox[{"97", ",", "3"}], "]"}]}], "}"}]}], ",", 
            RowBox[{"PlotLegends", "\[Rule]", 
             RowBox[{"LineLegend", "[", 
              RowBox[{"{", 
               RowBox[{"\"\<Humans\>\"", ",", "\"\<Creatures\>\""}], "}"}], 
              "]"}]}]}], "]"}], ",", "\[IndentingNewLine]", 
          RowBox[{"LogPlot", "[", 
           RowBox[{"Traj2", ",", 
            RowBox[{"{", 
             RowBox[{"t", ",", "end", ",", "T"}], "}"}], ",", 
            RowBox[{"PlotRange", "\[Rule]", 
             RowBox[{"{", 
              RowBox[{"1", ",", "All"}], "}"}]}], ",", 
            RowBox[{"PlotStyle", "\[Rule]", 
             RowBox[{"{", 
              RowBox[{
               RowBox[{"ColorData", "[", 
                RowBox[{"97", ",", "1"}], "]"}], ",", 
               RowBox[{"ColorData", "[", 
                RowBox[{"97", ",", "3"}], "]"}]}], "}"}]}]}], "]"}], ",", 
          "\[IndentingNewLine]", 
          RowBox[{"Graphics", "[", 
           RowBox[{"{", 
            RowBox[{
             RowBox[{"ColorData", "[", 
              RowBox[{"97", ",", "1"}], "]"}], ",", "Dashed", ",", 
             RowBox[{"Thickness", "[", "0.005", "]"}], ",", 
             RowBox[{"Line", "[", 
              RowBox[{"{", 
               RowBox[{
                RowBox[{"{", 
                 RowBox[{"end", ",", 
                  RowBox[{"Log", "@", "Hend"}]}], "}"}], ",", 
                RowBox[{"{", 
                 RowBox[{"end", ",", 
                  RowBox[{"Log", "@", 
                   RowBox[{"(", 
                    RowBox[{"10", "*", 
                    RowBox[{"10", "^", "9"}]}], ")"}]}]}], "}"}]}], "}"}], 
              "]"}]}], "}"}], "]"}], ",", "\[IndentingNewLine]", 
          RowBox[{"Graphics", "[", 
           RowBox[{"Text", "[", 
            RowBox[{"\"\<Global Comp.\>\"", ",", 
             RowBox[{"{", 
              RowBox[{"end", ",", 
               RowBox[{"Log", "@", 
                RowBox[{"(", 
                 RowBox[{"10", "^", "11"}], ")"}]}]}], "}"}]}], "]"}], "]"}], 
          ",", "\[IndentingNewLine]", 
          RowBox[{"Graphics", "[", 
           RowBox[{"Arrow", "[", 
            RowBox[{"{", 
             RowBox[{
              RowBox[{"{", 
               RowBox[{"end", ",", 
                RowBox[{"Log", "@", 
                 RowBox[{"(", 
                  RowBox[{"10", "^", "10.9"}], ")"}]}]}], "}"}], ",", 
              RowBox[{"{", 
               RowBox[{"end", ",", 
                RowBox[{"Log", "@", 
                 RowBox[{"(", 
                  RowBox[{"10", "^", "10.1"}], ")"}]}]}], "}"}]}], "}"}], 
            "]"}], "]"}]}], "\[IndentingNewLine]", "}"}], "]"}]}]}], 
     "\[IndentingNewLine]", "]"}]}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"K1", ",", 
       RowBox[{"600", "*", 
        RowBox[{"10", "^", "6"}]}], ",", 
       "\"\<Initial carrying capacity\>\""}], "}"}], ",", "10", ",", 
     RowBox[{"600", "*", 
      RowBox[{"10", "^", "6"}]}]}], "}"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"IH", ",", "8.8", ",", "\"\<Initial human population\>\""}], 
      "}"}], ",", "0", ",", "10"}], "}"}], ",", "\[IndentingNewLine]", 
   RowBox[{"(*", 
    RowBox[{"bookmark", " ", "control"}], "*)"}], "\[IndentingNewLine]", 
   RowBox[{"Grid", "[", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"{", 
       RowBox[{
        RowBox[{"Style", "[", 
         RowBox[{"\"\<Scenario\>\"", ",", "Bold"}], "]"}], ",", 
        RowBox[{"RadioButtonBar", "[", 
         RowBox[{
          RowBox[{"Dynamic", "[", 
           RowBox[{"bookMark", ",", 
            RowBox[{
             RowBox[{"{", 
              RowBox[{
               RowBox[{"bookMark", "=", "#"}], ";", "\[IndentingNewLine]", 
               RowBox[{"Which", "[", "\[IndentingNewLine]", 
                RowBox[{
                 RowBox[{"bookMark", "\[Equal]", "\"\<Europe\>\""}], ",", 
                 RowBox[{
                  RowBox[{"K1", "=", 
                   RowBox[{"600", "*", 
                    RowBox[{"10", "^", "6"}]}]}], ";", 
                  RowBox[{"IH", "=", "8.25"}]}], ",", "\[IndentingNewLine]", 
                 RowBox[{"bookMark", "\[Equal]", "\"\<Amazon\>\""}], ",", 
                 RowBox[{
                  RowBox[{"K1", "=", 
                   RowBox[{"1.383", "*", 
                    RowBox[{"10", "^", "6"}]}]}], ";", 
                  RowBox[{"IH", "=", "4.64"}]}]}], "\[IndentingNewLine]", 
                "]"}]}], "}"}], "&"}]}], "]"}], ",", 
          RowBox[{"{", 
           RowBox[{"\"\<Europe\>\"", ",", "\"\<Amazon\>\""}], "}"}], ",", 
          RowBox[{"Appearance", "\[Rule]", "\"\<Horizontal\>\""}]}], "]"}]}], 
       "}"}], "}"}], ",", 
     RowBox[{"Spacings", "\[Rule]", 
      RowBox[{"{", 
       RowBox[{".5", ",", "1"}], "}"}]}], ",", 
     RowBox[{"Frame", "\[Rule]", "False"}]}], "]"}], ",", 
   RowBox[{"{", 
    RowBox[{
     RowBox[{"{", 
      RowBox[{"bookMark", ",", "\"\<Europe\>\""}], "}"}], ",", "None"}], 
    "}"}]}], "\[IndentingNewLine]", "]"}]], "Input",
 CellOpen->False],

Cell[BoxData[
 TagBox[
  StyleBox[
   DynamicModuleBox[{$CellContext`bookMark$$ = "Amazon", $CellContext`IH$$ = 
    4.64, $CellContext`K1$$ = 1.383*^6, Typeset`show$$ = True, 
    Typeset`bookmarkList$$ = {}, Typeset`bookmarkMode$$ = "Menu", 
    Typeset`animator$$, Typeset`animvar$$ = 1, Typeset`name$$ = 
    "\"untitled\"", Typeset`specs$$ = {{{
       Hold[$CellContext`K1$$], 600000000, "Initial carrying capacity"}, 10, 
      600000000}, {{
       Hold[$CellContext`IH$$], 8.8, "Initial human population"}, 0, 10}, {
      Hold[
       Grid[{{
          Style["Scenario", Bold], 
          RadioButtonBar[
           
           Dynamic[$CellContext`bookMark$$, {$CellContext`bookMark$$ = #; 
             Which[$CellContext`bookMark$$ == 
               "Europe", $CellContext`K1$$ = 600 10^6; $CellContext`IH$$ = 
                8.25, $CellContext`bookMark$$ == 
               "Amazon", $CellContext`K1$$ = 1.383 10^6; $CellContext`IH$$ = 
                4.64]}& ], {"Europe", "Amazon"}, Appearance -> 
           "Horizontal"]}}, Spacings -> {0.5, 1}, Frame -> False]], 
      Manipulate`Dump`ThisIsNotAControl}, {{
       Hold[$CellContext`bookMark$$], "Europe"}, 0}}, Typeset`size$$ = {
    463., {170., 175.}}, Typeset`update$$ = 0, Typeset`initDone$$, 
    Typeset`skipInitDone$$ = True, $CellContext`K1$936400$$ = 
    0, $CellContext`IH$936401$$ = 0}, 
    DynamicBox[Manipulate`ManipulateBoxes[
     1, StandardForm, 
      "Variables" :> {$CellContext`bookMark$$ = "Europe", $CellContext`IH$$ = 
        8.8, $CellContext`K1$$ = 600000000}, "ControllerVariables" :> {
        Hold[$CellContext`K1$$, $CellContext`K1$936400$$, 0], 
        Hold[$CellContext`IH$$, $CellContext`IH$936401$$, 0]}, 
      "OtherVariables" :> {
       Typeset`show$$, Typeset`bookmarkList$$, Typeset`bookmarkMode$$, 
        Typeset`animator$$, Typeset`animvar$$, Typeset`name$$, 
        Typeset`specs$$, Typeset`size$$, Typeset`update$$, Typeset`initDone$$,
         Typeset`skipInitDone$$}, "Body" :> (Off[
         MessageName[
         InterpolatingFunction, "dmval"]]; $CellContext`CompDynStart[
          Pattern[$CellContext`rh, 
           Blank[]], 
          Pattern[$CellContext`rm, 
           Blank[]], 
          Pattern[$CellContext`ahm, 
           Blank[]], 
          Pattern[$CellContext`c, 
           Blank[]], 
          Pattern[$CellContext`k1, 
           Blank[]], 
          Pattern[$CellContext`InitialHPower, 
           Blank[]], 
          Pattern[$CellContext`T, 
           Blank[]]] := 
        NDSolve[{
          Derivative[
            1][$CellContext`H][$CellContext`t] == $CellContext`rh \
$CellContext`H[$CellContext`t] (
             1 - ($CellContext`H[$CellContext`t] + $CellContext`ahm \
$CellContext`M[$CellContext`t])/$CellContext`k1), 
           Derivative[
            1][$CellContext`M][$CellContext`t] == $CellContext`rm \
$CellContext`M[$CellContext`t] (
             1 - ($CellContext`M[$CellContext`t] + \
($CellContext`ahm/$CellContext`c) \
$CellContext`H[$CellContext`t])/$CellContext`k1), $CellContext`H[0] == 
           10^$CellContext`InitialHPower, $CellContext`M[0] == 2, 
           
           WhenEvent[$CellContext`M[$CellContext`t] == 
            0.9 $CellContext`k1, $CellContext`end = $CellContext`t; \
$CellContext`Hend = $CellContext`H[$CellContext`t]; $CellContext`Mend = \
$CellContext`M[$CellContext`t]; 
            "StopIntegration"]}, {$CellContext`H, $CellContext`M}, \
{$CellContext`t, 0, $CellContext`T}, MaxSteps -> Infinity, InterpolationOrder -> 
          All]; $CellContext`CompDynEnd[
          Pattern[$CellContext`rh, 
           Blank[]], 
          Pattern[$CellContext`rm, 
           Blank[]], 
          Pattern[$CellContext`ahm, 
           Blank[]], 
          Pattern[$CellContext`c, 
           Blank[]], 
          Pattern[$CellContext`k2, 
           Blank[]], 
          Pattern[$CellContext`T, 
           Blank[]], 
          Pattern[$CellContext`Mstart, 
           Blank[]], 
          Pattern[$CellContext`Tstart, 
           Blank[]]] := 
        NDSolve[{
          Derivative[
            1][$CellContext`H][$CellContext`t] == $CellContext`rh \
$CellContext`H[$CellContext`t] (
             1 - ($CellContext`H[$CellContext`t] + $CellContext`ahm \
$CellContext`M[$CellContext`t])/$CellContext`k2), 
           Derivative[
            1][$CellContext`M][$CellContext`t] == $CellContext`rm \
$CellContext`M[$CellContext`t] (
             1 - ($CellContext`M[$CellContext`t] + \
($CellContext`ahm/$CellContext`c) \
$CellContext`H[$CellContext`t])/$CellContext`k2), \
$CellContext`H[$CellContext`Tstart] == 
           10 10^9, $CellContext`M[$CellContext`Tstart] == \
$CellContext`Mstart}, {$CellContext`H, $CellContext`M}, {$CellContext`t, \
$CellContext`Tstart, $CellContext`T}, MaxSteps -> Infinity, 
          InterpolationOrder -> All]; 
       With[{$CellContext`rh = 0.0067, $CellContext`rm = 
          0.0067 1.5, $CellContext`ahm = 8, $CellContext`c = 
          10, $CellContext`InitialHPower = $CellContext`IH$$, $CellContext`k1 = \
$CellContext`K1$$, $CellContext`k2 = 10 10^9, $CellContext`T = 
          10^4, $CellContext`Mstart = $CellContext`Mend, $CellContext`Tstart = \
$CellContext`end}, Quiet[$CellContext`Traj1 = Evaluate[
             ReplaceAll[{
               $CellContext`H[$CellContext`t], 
               $CellContext`M[$CellContext`t]}, 
              $CellContext`CompDynStart[$CellContext`rh, $CellContext`rm, \
$CellContext`ahm, $CellContext`c, $CellContext`k1, \
$CellContext`InitialHPower, $CellContext`T]]]]; 
         Quiet[$CellContext`Traj2 = Evaluate[
             ReplaceAll[{
               $CellContext`H[$CellContext`t], 
               $CellContext`M[$CellContext`t]}, 
              $CellContext`CompDynEnd[$CellContext`rh, $CellContext`rm, \
$CellContext`ahm, $CellContext`c, $CellContext`k2, $CellContext`T, \
$CellContext`Mstart, $CellContext`Tstart]]]]; Show[{
            
            LogPlot[$CellContext`Traj1, {$CellContext`t, 0, $CellContext`end},
              PlotRange -> {{0, $CellContext`T}, {1, 10 10^12}}, AspectRatio -> 
             1, Frame -> True, 
             FrameLabel -> {"Years after 1816", "Population size"}, PlotStyle -> {
               ColorData[97, 1], 
               ColorData[97, 3]}, PlotLegends -> 
             LineLegend[{"Humans", "Creatures"}]], 
            
            LogPlot[$CellContext`Traj2, {$CellContext`t, $CellContext`end, \
$CellContext`T}, PlotRange -> {1, All}, PlotStyle -> {
               ColorData[97, 1], 
               ColorData[97, 3]}], 
            Graphics[{
              ColorData[97, 1], Dashed, 
              Thickness[0.005], 
              Line[{{$CellContext`end, 
                 Log[$CellContext`Hend]}, {$CellContext`end, 
                 Log[10 10^9]}}]}], 
            Graphics[
             Text["Global Comp.", {$CellContext`end, 
               Log[10^11]}]], 
            Graphics[
             Arrow[{{$CellContext`end, 
                Log[10^10.9]}, {$CellContext`end, 
                Log[10^10.1]}}]]}]]), 
      "Specifications" :> {{{$CellContext`K1$$, 600000000, 
          "Initial carrying capacity"}, 10, 
         600000000}, {{$CellContext`IH$$, 8.8, "Initial human population"}, 0,
          10}, 
        Grid[{{
           Style["Scenario", Bold], 
           RadioButtonBar[
            
            Dynamic[$CellContext`bookMark$$, {$CellContext`bookMark$$ = #; 
              Which[$CellContext`bookMark$$ == 
                "Europe", $CellContext`K1$$ = 600 10^6; $CellContext`IH$$ = 
                 8.25, $CellContext`bookMark$$ == 
                "Amazon", $CellContext`K1$$ = 1.383 10^6; $CellContext`IH$$ = 
                 4.64]}& ], {"Europe", "Amazon"}, Appearance -> 
            "Horizontal"]}}, Spacings -> {0.5, 1}, Frame -> 
         False], {{$CellContext`bookMark$$, "Europe"}, 0, ControlType -> 
         None}}, "Options" :> {}, "DefaultOptions" :> {}],
     ImageSizeCache->{508., {241., 246.}},
     SingleEvaluation->True],
    Deinitialization:>None,
    DynamicModuleValues:>{},
    SynchronousInitialization->True,
    UndoTrackedVariables:>{Typeset`show$$, Typeset`bookmarkMode$$},
    UnsavedVariables:>{Typeset`initDone$$},
    UntrackedVariables:>{Typeset`size$$}], "Manipulate",
   Deployed->True,
   StripOnInput->False],
  Manipulate`InterpretManipulate[1]]], "Output"]
}, Open  ]]
},
WindowSize->{613, 640},
Visible->True,
ScrollingOptions->{"VerticalScrollRange"->Fit},
ShowCellBracket->Automatic,
CellContext->Notebook,
TrackCellChangeTimes->False,
FrontEndVersion->"10.0 for Mac OS X x86 (32-bit, 64-bit Kernel) (September 9, \
2014)",
StyleDefinitions->"Default.nb"
]
(* End of Notebook Content *)

(* Internal cache information *)
(*CellTagsOutline
CellTagsIndex->{}
*)
(*CellTagsIndex
CellTagsIndex->{}
*)
(*NotebookFileOutline
Notebook[{
Cell[CellGroupData[{
Cell[1486, 35, 12823, 322, 1360, "Input",
 CellOpen->False],
Cell[14312, 359, 8364, 181, 504, "Output"]
}, Open  ]]
}
]
*)

(* End of internal cache information *)

(* NotebookSignature ZwpyfCkYHozywAwAvn5YHM8d *)
