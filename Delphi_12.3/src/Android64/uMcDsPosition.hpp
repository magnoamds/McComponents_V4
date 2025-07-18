// CodeGear C++Builder
// Copyright (c) 1995, 2025 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'uMcDsPosition.pas' rev: 36.00 (Android)

#ifndef uMcDsPositionHPP
#define uMcDsPositionHPP

#pragma delphiheader begin
#pragma option push
#if defined(__BORLANDC__) && !defined(__clang__)
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#endif
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <System.SysUtils.hpp>
#include <System.Classes.hpp>
#include <System.Variants.hpp>
#include <Data.DB.hpp>

//-- user supplied -----------------------------------------------------------

namespace Umcdsposition
{
//-- forward type declarations -----------------------------------------------
class DELPHICLASS TMcDsPosition;
//-- type declarations -------------------------------------------------------
class PASCALIMPLEMENTATION TMcDsPosition : public System::TObject
{
	typedef System::TObject inherited;
	
private:
	System::UnicodeString FKeyFieldNames;
	System::Variant FKeyValues;
	bool __fastcall CanSaveKeyValues(Data::Db::TDataSet* ADataSet, const System::DynamicArray<System::UnicodeString> AFieldList);
	
public:
	void __fastcall SavePosition(Data::Db::TDataSet* ADataSet, const System::UnicodeString AKeyFields);
	void __fastcall RestorePosition(Data::Db::TDataSet* DataSet);
public:
	/* TObject.Create */ inline __fastcall TMcDsPosition() : System::TObject() { }
	/* TObject.Destroy */ inline __fastcall virtual ~TMcDsPosition() { }
	
};


//-- var, const, procedure ---------------------------------------------------
}	/* namespace Umcdsposition */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_UMCDSPOSITION)
using namespace Umcdsposition;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// uMcDsPositionHPP
