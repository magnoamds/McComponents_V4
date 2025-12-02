// CodeGear C++Builder
// Copyright (c) 1995, 2024 by Embarcadero Technologies, Inc.
// All rights reserved

// (DO NOT EDIT: machine generated header) 'uMcResponseNetHTTP.pas' rev: 36.00 (Android)

#ifndef UmcresponsenethttpHPP
#define UmcresponsenethttpHPP

#pragma delphiheader begin
#pragma option push
#if defined(__BORLANDC__) && !defined(__clang__)
#pragma option -w-      // All warnings off
#pragma option -Vx      // Zero-length empty class member 
#endif
#pragma pack(push,8)
#include <System.hpp>
#include <SysInit.hpp>
#include <uMcRestContract.hpp>
#include <System.Net.HttpClientComponent.hpp>
#include <System.Net.HttpClient.hpp>
#include <System.Net.URLClient.hpp>
#include <System.SysUtils.hpp>
#include <System.Classes.hpp>

//-- user supplied -----------------------------------------------------------

namespace Umcresponsenethttp
{
//-- forward type declarations -----------------------------------------------
class DELPHICLASS TMcResponseNetHTTP;
//-- type declarations -------------------------------------------------------
#pragma pack(push,4)
class PASCALIMPLEMENTATION TMcResponseNetHTTP : public System::TInterfacedObject
{
	typedef System::TInterfacedObject inherited;
	
private:
	System::Net::Httpclient::_di_IHTTPResponse FHTTPResponse;
	System::Classes::TStringStream* FContent;
	System::Classes::TStrings* FHeaders;
	System::UnicodeString __fastcall Content();
	unsigned __fastcall ContentLength();
	System::UnicodeString __fastcall ContentType();
	System::UnicodeString __fastcall ContentEncoding();
	System::Classes::TStream* __fastcall ContentStream();
	int __fastcall StatusCode();
	System::UnicodeString __fastcall StatusText();
	System::Sysutils::TBytes __fastcall RawBytes();
	System::Classes::TStrings* __fastcall Headers();
	
public:
	__fastcall TMcResponseNetHTTP();
	__classmethod Umcrestcontract::_di_IMcResponse __fastcall New();
	void __fastcall SetContent(System::Classes::TStringStream* const AContent);
	void __fastcall SetHTTPResponse(const System::Net::Httpclient::_di_IHTTPResponse AHTTPResponse);
	__fastcall virtual ~TMcResponseNetHTTP();
private:
	void *__IMcResponse;	// Umcrestcontract::IMcResponse 
	
public:
	#if defined(MANAGED_INTERFACE_OPERATORS)
	// {62F173B5-A01B-447B-9D01-4ECBC1D0B744}
	operator Umcrestcontract::_di_IMcResponse()
	{
		Umcrestcontract::_di_IMcResponse intf;
		this->GetInterface(intf);
		return intf;
	}
	#else
	operator Umcrestcontract::IMcResponse*(void) { return (Umcrestcontract::IMcResponse*)&__IMcResponse; }
	#endif
	
};

#pragma pack(pop)

//-- var, const, procedure ---------------------------------------------------
}	/* namespace Umcresponsenethttp */
#if !defined(DELPHIHEADER_NO_IMPLICIT_NAMESPACE_USE) && !defined(NO_USING_NAMESPACE_UMCRESPONSENETHTTP)
using namespace Umcresponsenethttp;
#endif
#pragma pack(pop)
#pragma option pop

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// UmcresponsenethttpHPP
