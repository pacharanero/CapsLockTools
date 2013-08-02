;====ABOUT====
; This is an AutoHotKey script that implements MedicalAutoCorrect against common medical mis-spellings.
; It also auto-expands abbreviations and acronyms. (c) Marcus Baw 2012

;====LICENSE - (EXCLUDES ***CAPS LOCK TOOLS***, WHICH I DID NOT WRITE)====
; This program is free software: you can redistribute it and/or modify
; it under the terms of the GNU General Public License as published by
; the Free Software Foundation, either version 3 of the License, or
; (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program. If not, see [http://www.gnu.org/licenses/].

;====CONTACT====
; contact me at marcusbaw@gmail.com

;====INFORMATION====
; * This is an AutoHotKey script that implements MedicalAutoCorrect against common medical mis-spellings
; * It also auto-expands abbreviations and acronyms.
; * It works with any Windows based GP clinical system, eg Systm1 (tested)
; * Also works with standard applications eg Word, Notepad etc
; * It is based on the AHK script 'AutoCorrect', I have just added some 'medical' terminology.
; I have removed the rest of the 'AutoCorrect' word replacements, if you require these it is a
; simple matter to run that script simultaneously
; * MedicalAutoCorrect is heavily slanted towards UK General Practice, and, specifically, mine.

;====2nd Disclaimer====
; * NO WARRANTY IS MADE ABOUT THE FITNESS FOR PURPOSE OF THIS SCRIPT, YOU ARE WHOLLY RESPONSIBLE FOR REVIEWING THE CODE
; AND DECIDING IF IT IS SAFE TO USE IN YOUR PRACTICE. CONTRIBUTORS TO THIS SCRIPT CANNOT BE HELD LIABLE
; FOR DOCUMENTATION ERRORS AND/OR CLINICAL ERRORS RESULTING FROM ITS USE.
;
;
; 
;-----------------------------------------------------------------------------------------------------------
; ***MEDICAL AUTOCORRECT***
;-----------------------------------------------------------------------------------------------------------
; NOTES
;-----------------------------------------------------------------------------------------------------------
; to add a new autocorrect,:
; 1) start a new line with: "::"
; 2) insert the text you want to replace
; 3) then "::" again
; 4) then what you want to replace it with
;
; There is no need to add it in both upper and lower case, AutoHotKey will automatically
; recognise this & behave accordingly: thus "CCF"=>"CONGESTIVE CARDIAC FAILURE"
; but "ccf"=>"congestive cardiac failure"
;
; To alter this behaviour so that "CCF"=>"congestive cardiac failure", ie for acronyms,
; use the syntax -
;                       :C1:congestive cardiac failure::congestive cardiac failure
; the :C1: modifier stops AHK from altering the case
;
;
;-----------------------------------------------------------------------------------------------------------
;      Settings
;-----------------------------------------------------------------------------------------------------------
#NoEnv ; For security & Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
#Hotstring R  ; Set the default to be "raw mode" (might not actually be relied upon by anything yet).
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;
;

^SPACE:: Winset, Alwaysontop, , A ;Keeps current window on top permanently
#n::Run Notepad ;Windows Key & 'n' launches Notepad
#p::Pause ; Pressing Win+P once will pause the script. Pressing it again will unpause.
;
;
;
;-----------------------------------------------------------------------------------------------------------
;      MEDICAL AUTOCORRECT - MIS-SPELLINGS
;-----------------------------------------------------------------------------------------------------------
::symtpoms::symptoms
::ischeamic::ischaemic
::O?E::O/E
::O.E::O/E
::A?C::A/C
::A7E::A&E
::baldder::bladder
::hypertenion::hypertension
::hernis::hernia
::shoudler::shoulder
::opthalmology::ophthalmology
::nitgh::night
::nigth::night
:C1:dr::Dr.
:C1:DR::Dr.
::migarine::migraine


;-----------------------------------------------------------------------------------------------------------
;      MEDICAL AUTOCORRECT - AUTO-CAPITALISATION
;-----------------------------------------------------------------------------------------------------------
:C1:perla::PERLA
:C1:bp::BP
:C1:med3::MED3
:C1:nad::NAD

;
;
;-----------------------------------------------------------------------------------------------------------
;      MEDICAL AUTOCORRECT - AUTO-EXPAND ACRONYM
;      note - ":C1:" syntax stops AHK from making the replacement text the same case as the hotstring
;-----------------------------------------------------------------------------------------------------------
:C1:SNT::soft & non-tender
:C1:AHT::anti-hypertensive
:C1:AHM::anti-histamine
:C1:CCF::congestive cardiac failure
:C1:AE::air entry
:C1:NCS::nerve conduction studies
:C1:SI/MT::suicidal ideation/morbid thoughts
:C1:URTI::Upper Respiratory Tract Infection
:C1:LRTI::Lower Respiratory Tract Infection
:C1:TMJ::Temporo-mandibular Joint
:C1:UPSI::unprotected sexual intercourse
:C1:OTC::over-the-counter
:C1:AO::ankle oedema
:C1:RIF::right iliac fossa
:C1:LIF::left iliac fossa
:C1:NBT::no bony tenderness
:C1:MCL::medial collateral ligament
:C1:LCL::lateral collateral ligament
:C1:ACL::anterior cruciate ligament
:C1:PCL::posterior cruciate ligament
:C1:NKDA::no known drug allergies
:C1:COCP::combined oral contraceptive pill
:C1:CI::contraindication
:C1:AE::air entry
:C1:CIBH::change in bowel habit
:C1:LLT::lipid lowering therapy
:C1:CCG::Clinical Commissioning Group
:C1:NRT::Nicotine Replacement Therapy
;
;
;-----------------------------------------------------------------------------------------------------------
;      MEDICAL AUTOCORRECT - AUTO-EXPAND ABBREVIATION
;-----------------------------------------------------------------------------------------------------------
:C1:2ndry::secondary
:C1:A/C::anticoagulant
:C1:pt::patient
:C1:BrCa::breast cancer
:C1:2ndry::secondary
:C1:MCr::Manchester
:C1:distbn::distribution
:C1:distb::disturbance
:C1:adv::advised
:C1:palpn::palpation
;:C1:LoW::loss of weight		commented out as it clashed with the common word "low"
:C1:OtExt::otitis externa
:C1:tfr::therefore
:C1:mfr::manufacturer
:C1:sph distb::sphincter disturbance
:C1:LT::left
:C1:RT::right



;-----------------------------------------------------------------------------------------------------------
;      ***suffix-O-Fix***
;-----------------------------------------------------------------------------------------------------------
:?:itits::itis



;-----------------------------------------------------------------------------------------------------------
;      "AUTO-CONSULT"
;-----------------------------------------------------------------------------------------------------------

::<tel>::
SendInput, Telephone consultation:
Timestamp()
Return

::<f2f>::<face-to-face consultation>

::<ftel>::
SendInput, Failed telephone consultation:
Timestamp()
Return

::<recep>::GP Reception: no injuries, no allergies, no major medical problems, no current medications.

::msg left::short generic message left on voice mail

::no msg::unable to leave message - no voice mail

::<knee>::ligaments all intact, no effusion, normal ROM, no deformity, no evidence of significant knee injury

::<child>::<add child safety-netting here>

::<dentalpain>::Patient reports dental pain and is requesting analgesia which has been prescribed. It remains the patient's responsibility to make an application for the dentist.

::<dentalabcess>::Patient reports dental pain from an abcess and is requesting analgesia and antibiotics, which have been prescribed. Antibiotics are NOT the definitive treatment for a dental abcess and further dental treatment may be required. It remains the patient's responsibility to make an application to see the dentist.

::<bld>::Please book this patient in for routine blood clinic - thanks


::m@g::marcusbaw@gmail.com

::<time>::
Timestamp()
Return

;sends current time to input cursor in the format HH:MM (24h)
Timestamp()
{
FormatTime, Time, ,HH:mm
SendInput, %Time%
Return
}


;-----------------------------------------------------------------------------------------------------------
;MEDICAL AUTOCORRECT IDEAS
;-----------------------------------------------------------------------------------------------------------
;
;need a way to prevent hotkey replacement (?pop up with word to replace before replacing?)
;
;Auto-Consult menu
;Failed Telephone Contact:
;        Message Left
;                no answer, short generic message left - patient to call back
;                no answer, short generic message left - I will try calling again
;        Message Not Left
;                no messaging service - I will try calling again
;                call was not connected - I will try calling again
;        Final Attempt
;
;"auto-consult" for ANY clinical system using AHK
;
;
;-----------------------------------------------------------------------------------------------------------
; ***CAPS LOCK TOOLS***
;----------------------------------------------------------------------------------------------------------
;
;
AutoTrim On  ; Strip out any leading and trailing whitespace from selection

;------------------------------
; "Smart Titles" RegEx function - short words keep lower-case
; thanks to Gogo http://www.autohotkey.com/forum/post-495722.html
Needle =
(join ltrim comments         ; first (in the sentence) acronym (upper case $U3)
  (^|[.!?:;])\W*\K(([A-Z]{2,4})\b
                  |([\w']+))          ; any other first word   (title case $T4)
                                       ; not first small words (lower case $L5)
  |\b(?i)(a|an|and|as|at|but|by|for|from
  |if|in|nor|of|off|on|or|so|the|to|up|yet)\b
  |\b(?-i)([A-Z]{2,4})\b                  ; not first acronym  (upper case $U6)
  |\b([\w']+)                               ; any other word   (title case $T7)
)

;------------------------------
; Clip() function
;http://www.autohotkey.com/forum/viewtopic.php?p=467710
Clip(Text="", Reselect="") {
   Static BackUpClip, Stored
   If (A_ThisLabel = "Clip")
      Return Stored := "", Clipboard := BackUpClip, BackUpClip := ""
   If Stored
      SetTimer, Clip, Off
   Else {
      Stored := True
      BackUpClip := ClipboardAll
   }
   Clipboard := ""
   If (Text = "") {
      Send, ^c
      ClipWait, 0.15
   } Else {
      Clipboard := Text
      ClipWait, 3
      Send, ^v
   }
   SetTimer, Clip, -700
   If (Text = "")
      Return Clipboard
   Else If (ReSelect = True) or (Reselect and (StrLen(Text) < 3000)) {
      StringReplace, Text, Text, `r, , All
      Send, % "{Shift Down}{Left " StrLen(Text) "}{Shift Up}"
   }
   Return
   Clip:
   Return Clip()
}


;------------------------------
; TabsToSpaces function
; http://www.autohotkey.com/forum/viewtopic.php?p=495999
TabsToSpaces(Str, outEOL="`r`n", EOL="`n", Omit="`r"){ ;
  Loop Parse, Str, %EOL%, %Omit%             ;
  {                                          ;
     index := 0                              ; Used instead of A_Index
     Loop Parse, A_LoopField                 ;  since we can change it
     {                                       ;
             index++                         ; increment manually
             If (A_LoopField = A_Tab){       ;
                     Loop % 2-Mod(index, 2)  ;
                             r .= " "        ;
                     index := -1             ; it's aligned now,
             }                               ;  so next tab will be 2
             else    r .= A_LoopField        ;
     }                                       ;
     r .= outEOL                             ;
  }                                          ;
  StringTrimRight, r, r, % StrLen(outEOL)    ; remove trailing `r`n
  return r                                   ;
}                                            ;


;------------------------------
; Main menu
;
; *=Fire the hotkey even if extra modifiers are being held down
*CapsLock::
Gosub,MENU
Return

MENU:
Menu,main,Add,CapsLock &On,ON
Menu,main,Add,&CapsLock Off,OFF
Menu,main,Add,&UPPER CASE,UPPER
Menu,main,Add,&lower case,LOWER
Menu,main,Add,&Title Case,TITLE
Menu,main,Add,&First word only,SENTENCE
Menu,main,Add,T&abs to spaces,TAB2SPACES
Menu,main,Add,Spaces to &_,UNDERSCORES
Menu,main,Add,_ to &spaces,_2SPACES
Menu,main,Add,&camelCase,CAMEL_CASE
Menu,main,Add,&NO_CAMEL_CASE,NO_CAMEL_CASE
Menu,main,Add,&iNVERT cASE,INVERT
Menu,main,Show
Return

ON:
SetCapsLockState,On
Return

OFF:
SetCapsLockState,Off
Return

UPPER:
selection := Clip()
StringUpper,selection,selection
Clip( selection, True )
Return

LOWER:
selection := Clip()
StringLower,selection,selection
Clip( selection, True )
Return

TITLE:
Clip( RegExReplace(Clip(),Needle,"$U3$T4$L5$U6$T7"), True )
Return

SENTENCE:
Clip( RegExReplace(Clip(),"(\w)([^?.:!]*)","$U1$L2"), True )
Return

INVERT:
Clip( RegExReplace(Clip(),"([^a-z]+)|([^A-Z]+)","$L1$U2"), True )
Return

CAMEL_CASE:
; thanks to jpjazzy and Gogo http://www.autohotkey.com/forum/post-495722.html
; from phrase separated_by_or-to lowerCamelCase
; with customizable delimiters [ -_]
string := Clip()
Clip( RegExReplace(string, "(([A-Z]+)|(?i)((?<=[a-z])|[a-z])([a-z]*))[ _-]([a-z]|[A-Z]+)", "$L2$L3$4$T5"))
Return

NO_CAMEL_CASE:
; from camelCase to ALL_UPPER
; this not working, waiting on Gogo for RegEx version?
; Clip(RegExReplace(Clip(), "[a-z]\K[A-Z]", "_$U0")) 
AutoTrim,Off
StringCaseSense,On
selection := Clip()
lower=abcdefghijklmnopqrstuvwxyzaoa
upper=ABCDEFGHIJKLMNOPQRSTUVWXYZAOA
StringLen,length,selection
iter:=0
Loop,%length%
{                                        ; translation notes
  StringLeft,char,selection,1            ; store leftmost char in %char%
  StringGetPos,pos,lower,%char%          ; look in lower, return -1 if not
  pos+=1                                 ; add 1, 0 means not lowercase alpha
  If pos<>0                              ; if lowercase alpha
    StringMid,char,upper,%pos%,1         ;   convert %char% to uppercase
  Else ;pos==0                           ; if not lowercase alpha
  {                                      ;
    StringGetPos,pos,upper,%char%        ; look in upper, return -1 if not
    pos+=1                               ;
    If pos<>0                            ; if uppercase alpha
    {                                    ;
      StringMid,char,upper,%pos%,1       ; ? %char% already upper, why get it?
      If iter<>0                         ; don't lead with an underscore
        char=_%char%                     ; insert an underscore
    }                                    ;
  }                                      ;
  StringTrimLeft,selection,selection,1   ; remove the leftmost character
  selection=%selection%%char%            ; append %char% to end
  iter+=1                                ; iterate the loop counter and loop
}
Clip( selection, True )
Return

UNDERSCORES:
selection := Clip()
StringReplace, selection, selection, %A_Space%, _, 1
Clip( selection, True )
Return

_2SPACES:
selection := Clip()
StringReplace, selection, selection, _, %A_Space%, 1
Clip( selection, True )
Return

TAB2SPACES:
;Tabs2Spaces(Str, AlignNum=8, ... )
; Replace both 8's with the parameter's name.
; MsgBox, Replace TABs with how many spaces?
Clip(TabsToSpaces(clip()), True)
return

;--------------------

EMPTY:
Return

ABOUT:
MsgBox,0,AppletTitle,%About%
Return

QUIT:
ExitApp

About =
(LTrim0
Marcus' AHK scripts:
CapsLockTools
MedicalAutoCorrect
GeneralScripts
)
<<<<<<< HEAD
=======
    
>>>>>>> 3b4b86c1b8116e1888c5656ba14581ec55a91142
