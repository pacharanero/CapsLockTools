; MEDICAL AUTOCORRECT
; 
; * This is an AutoHotKey script that implements MedicalAutoCorrect against common medical mis-spellings
;
; * It also auto-expands abbreviations and acronyms.
;
; * It works with any Windows based GP clinical system, eg Systm1 (tested)
;
; * Also works with standard applications eg Word, Notepad etc
; 
; * It is based on the AHK script 'AutoCorrect', I have just added some 'medical' terminology.
;   I have removed the rest of the 'AutoCorrect' word replacements, if you require these it is a
;   simple matter to run that script simultaneously 
;
; * MedicalAutoCorrect is heavily slanted towards UK General Practice, and, specifically, mine.
;
; * NO WARRANTY IS MADE ABOUT ITS FITNESS FOR PURPOSE, YOU ARE WHOLLY RESPONSIBLE FOR REVIEWING THE CODE
;   AND DECIDING IF IT IS SAFE TO USE IN YOUR PRACTICE. CONTRIBUTORS TO THIS SCRIPT CANNOT BE HELD LIABLE
;   FOR DOCUMENTATION ERRORS AND/OR CLINICAL ERRORS RESULTING FROM ITS USE.
;
;-----------------------------------------------------------------------------------------------------------
;; NOTES
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
;
;       :C1:congestive cardiac failure::congestive cardiac failure
;
; the :C1: modifier stops it from 


;-----------------------------------------------------------------------------------------------------------
;      Settings
;-----------------------------------------------------------------------------------------------------------
#NoEnv ; For security
#SingleInstance force
#Hotstring R  ; Set the default to be "raw mode" (might not actually be relied upon by anything yet).

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


;-----------------------------------------------------------------------------------------------------------
;      MEDICAL AUTOCORRECT - AUTO-EXPAND ACRONYM
;      note - ":C1:" syntax stops AHK from making the replacement text the same case as the hotstring
;-----------------------------------------------------------------------------------------------------------
:C1:NAD::Nothing Abnormal Detected
:C1:SNT::Soft & Non-Tender
:C1:AHT::anithypertensive
:C1:AHM::antihistamine
:C1:CCF::congestive cardiac failure
:C1:AE::air entry
:C1:NCS::nerve conduction studies
:C1:SI/MT::suicidal ideation/morbid thoughts
:C1:URTI::Upper Respiratory Tract Infection
:C1:LRTI::Lower Respiratory Tract Infection
:C1:TMJ::Temporo-mandibular Joint
:C1:UPSI::Unprotected Sexual Intercourse
:C1:OTC::over-the-counter
:C1:AO::ankle oedema
:C1:RIF::right iliac fossa
:C1:LIF::left iliac fossa
:C1:NBT::no bony tenderness
:C1:MCL::medial collateral ligament
:C1:LCL::lateral collateral ligament
:C1:ACL::anterior cruciate ligament
:C1:PCL::posterior cruciate ligament
:C1:NKDA::No Known Drug Allergies
:C1:COCP::Combined Oral Contraceptive Pill
:C1:CI::contraindication
:C1:AE::air entry
:C1:CIBH::change in bowel habit
:C1:CXR::chest x-ray
:C1:ASAP::as soon as possible


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
:C1:LoW::loss of weight
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
;IDEAS
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
