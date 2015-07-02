

%Module(name=PyQt5.QtPropertyBrowser, keyword_arguments="Optional")

%Import QtCore/QtCoremod.sip
%Import QtGui/QtGuimod.sip
%Import QtWidgets/QtWidgetsmod.sip

%Include qtpropertybrowser_modcommon.sip

%If (PyQt_Printer)
%Import QtPrintSupport/QtPrintSupportmod.sip
%End
