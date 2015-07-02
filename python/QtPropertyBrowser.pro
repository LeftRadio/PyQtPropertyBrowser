TEMPLATE = lib
CONFIG += release
CONFIG += plugin
CONFIG += qpropertybrowser
CONFIG -= android_install

win32 {
    PY_MODULE = QtPropertyBrowser.pyd
    target.files = QtPropertyBrowser.pyd
    LIBS += -LC:\Python34\libs
} else {
    PY_MODULE = QtPropertyBrowser.so
    target.files = QtPropertyBrowser.so
}

target.CONFIG = no_check_exist

target.path = C:\Python34\Lib\site-packages\PyQt5
INSTALLS += target

sip.path = C:\Python34\sip\PyQt5\QtPropertyBrowser
sip.files = \
    sip\qtbuttonpropertybrowser.sip \
    sip\qteditorfactory.sip \
    sip\qtgroupboxpropertybrowser.sip \
    sip\qtpropertybrowser.sip \
    sip\qtpropertybrowserutils_p.sip \
    sip\qtpropertybrowser_mod5.sip \
    sip\qtpropertybrowser_modcommon.sip \
    sip\qtpropertymanager.sip \
    sip\qttreepropertybrowser.sip \
    sip\qtvariantproperty.sip
INSTALLS += sip

DEFINES += QPROPERTYBROWSER_DLL
INCLUDEPATH += ..\qt-solutions-qt-solutions\qtpropertybrowser\src
INCLUDEPATH += C:\Python34\include

win32 {
    QMAKE_POST_LINK = $(COPY_FILE) $(DESTDIR_TARGET) $$PY_MODULE
} else {
    QMAKE_POST_LINK = $(COPY_FILE) $(TARGET) $$PY_MODULE
}

macx {
    QMAKE_LFLAGS += "-undefined dynamic_lookup"
    greaterThan(QT_MAJOR_VERSION, 4) {
        QMAKE_LFLAGS += "-install_name $$absolute_path($$PY_MODULE, $$target.path)"
    }

    QMAKE_POST_LINK = $$QMAKE_POST_LINK$$escape_expand(\\n\\t)$$quote(install_name_tool -change libqpropertybrowser.dylib C:/Qt/Qt5.4.1/5.4/mingw491_32/lib\libqpropertybrowser.dylib $$PY_MODULE)
}

TARGET = QtPropertyBrowser
HEADERS = sipAPIQtPropertyBrowser.h
SOURCES = \
    sipQtPropertyBrowsercmodule.cpp \
    sipQtPropertyBrowserQList0101QtBrowserItem.cpp \
    sipQtPropertyBrowserQList0101QtProperty.cpp \
    sipQtPropertyBrowserQMap18000100QIcon.cpp \
    sipQtPropertyBrowserQSet0101QtProperty.cpp \
    sipQtPropertyBrowserQtAbstractEditorFactoryBase.cpp \
    sipQtPropertyBrowserQtAbstractPropertyBrowser.cpp \
    sipQtPropertyBrowserQtAbstractPropertyManager.cpp \
    sipQtPropertyBrowserQtBoolPropertyManager.cpp \
    sipQtPropertyBrowserQtBrowserItem.cpp \
    sipQtPropertyBrowserQtButtonPropertyBrowser.cpp \
    sipQtPropertyBrowserQtCharEditorFactory.cpp \
    sipQtPropertyBrowserQtCharPropertyManager.cpp \
    sipQtPropertyBrowserQtCheckBoxFactory.cpp \
    sipQtPropertyBrowserQtColorEditorFactory.cpp \
    sipQtPropertyBrowserQtColorPropertyManager.cpp \
    sipQtPropertyBrowserQtCursorEditorFactory.cpp \
    sipQtPropertyBrowserQtCursorPropertyManager.cpp \
    sipQtPropertyBrowserQtDateEditFactory.cpp \
    sipQtPropertyBrowserQtDatePropertyManager.cpp \
    sipQtPropertyBrowserQtDateTimeEditFactory.cpp \
    sipQtPropertyBrowserQtDateTimePropertyManager.cpp \
    sipQtPropertyBrowserQtDoublePropertyManager.cpp \
    sipQtPropertyBrowserQtDoubleSpinBoxFactory.cpp \
    sipQtPropertyBrowserQtEnumEditorFactory.cpp \
    sipQtPropertyBrowserQtEnumPropertyManager.cpp \
    sipQtPropertyBrowserQtFlagPropertyManager.cpp \
    sipQtPropertyBrowserQtFontEditorFactory.cpp \
    sipQtPropertyBrowserQtFontPropertyManager.cpp \
    sipQtPropertyBrowserQtGroupBoxPropertyBrowser.cpp \
    sipQtPropertyBrowserQtGroupPropertyManager.cpp \
    sipQtPropertyBrowserQtIntPropertyManager.cpp \
    sipQtPropertyBrowserQtKeySequenceEditorFactory.cpp \
    sipQtPropertyBrowserQtKeySequencePropertyManager.cpp \
    sipQtPropertyBrowserQtLineEditFactory.cpp \
    sipQtPropertyBrowserQtLocalePropertyManager.cpp \
    sipQtPropertyBrowserQtPointFPropertyManager.cpp \
    sipQtPropertyBrowserQtPointPropertyManager.cpp \
    sipQtPropertyBrowserQtProperty.cpp \
    sipQtPropertyBrowserQtRectFPropertyManager.cpp \
    sipQtPropertyBrowserQtRectPropertyManager.cpp \
    sipQtPropertyBrowserQtScrollBarFactory.cpp \
    sipQtPropertyBrowserQtSizeFPropertyManager.cpp \
    sipQtPropertyBrowserQtSizePolicyPropertyManager.cpp \
    sipQtPropertyBrowserQtSizePropertyManager.cpp \
    sipQtPropertyBrowserQtSliderFactory.cpp \
    sipQtPropertyBrowserQtSpinBoxFactory.cpp \
    sipQtPropertyBrowserQtStringPropertyManager.cpp \
    sipQtPropertyBrowserQtTimeEditFactory.cpp \
    sipQtPropertyBrowserQtTimePropertyManager.cpp \
    sipQtPropertyBrowserQtTreePropertyBrowser.cpp \
    sipQtPropertyBrowserQtVariantEditorFactory.cpp \
    sipQtPropertyBrowserQtVariantProperty.cpp \
    sipQtPropertyBrowserQtVariantPropertyManager.cpp
