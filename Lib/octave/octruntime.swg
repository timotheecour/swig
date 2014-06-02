//
// octruntime.swg - Octave runtime code
//

// Insert standard SWIG runtime code
%insert("runtime") "swigrun.swg";
%insert("runtime") "swigerrors.swg";
%insert("code") "swiginit.swg"

// Declarations of Octave runtime code
%insert("runtime") "octrundecl.swg";

// Octave runtime functions
%insert("code") "octrunfunc.swg"

// Octave runtime classes
%insert("code") "octrunclass.swg"

// Octave runtime initialisation code
%insert("code") "octruninit.swg"
