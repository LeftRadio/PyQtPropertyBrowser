/****************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Solutions component.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
**     of its contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/


class QtGroupPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtGroupPropertyManager(QObject *parent /TransferThis/= 0);
    ~QtGroupPropertyManager();

protected:
    virtual bool hasValue(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);
};



class QtIntPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtIntPropertyManager(QObject *parent = 0);
    ~QtIntPropertyManager();

    int value(const QtProperty *property) const;
    int minimum(const QtProperty *property) const;
    int maximum(const QtProperty *property) const;
    int singleStep(const QtProperty *property) const;
    bool isReadOnly(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, int val);
    void setMinimum(QtProperty *property, int minVal);
    void setMaximum(QtProperty *property, int maxVal);
    void setRange(QtProperty *property, int minVal, int maxVal);
    void setSingleStep(QtProperty *property, int step);
    void setReadOnly(QtProperty *property, bool readOnly);

Q_SIGNALS:
    void valueChanged(QtProperty *property, int val);
    void rangeChanged(QtProperty *property, int minVal, int maxVal);
    void singleStepChanged(QtProperty *property, int step);
    void readOnlyChanged(QtProperty *property, bool readOnly);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtIntPropertyManager(const QtIntPropertyManager &);
    QtIntPropertyManager &operator=(const QtIntPropertyManager &);    
};



class QtBoolPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtBoolPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtBoolPropertyManager();

    bool value(const QtProperty *property) const;
    bool textVisible(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, bool val);
    void setTextVisible(QtProperty *property, bool textVisible);

Q_SIGNALS:
    void valueChanged(QtProperty *property, bool val);
    void textVisibleChanged(QtProperty *property, bool);

protected:
    QString valueText(const QtProperty *property) const;
    QIcon valueIcon(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtBoolPropertyManager(const QtBoolPropertyManager &);
    QtBoolPropertyManager &operator=(const QtBoolPropertyManager &);
};



class QtDoublePropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtDoublePropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtDoublePropertyManager();

    double value(const QtProperty *property) const;
    double minimum(const QtProperty *property) const;
    double maximum(const QtProperty *property) const;
    double singleStep(const QtProperty *property) const;
    int decimals(const QtProperty *property) const;
    bool isReadOnly(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, double val);
    void setMinimum(QtProperty *property, double minVal);
    void setMaximum(QtProperty *property, double maxVal);
    void setRange(QtProperty *property, double minVal, double maxVal);
    void setSingleStep(QtProperty *property, double step);
    void setDecimals(QtProperty *property, int prec);
    void setReadOnly(QtProperty *property, bool readOnly);

Q_SIGNALS:
    void valueChanged(QtProperty *property, double val);
    void rangeChanged(QtProperty *property, double minVal, double maxVal);
    void singleStepChanged(QtProperty *property, double step);
    void decimalsChanged(QtProperty *property, int prec);
    void readOnlyChanged(QtProperty *property, bool readOnly);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtDoublePropertyManager(const QtDoublePropertyManager &);
    QtDoublePropertyManager &operator=(const QtDoublePropertyManager &);
};




class QtStringPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtStringPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtStringPropertyManager();

    QString value(const QtProperty *property) const;
    QRegExp regExp(const QtProperty *property) const;
    EchoMode echoMode(const QtProperty *property) const;
    bool isReadOnly(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QString &val);
    void setRegExp(QtProperty *property, const QRegExp &regExp);
    void setEchoMode(QtProperty *property, EchoMode echoMode);
    void setReadOnly(QtProperty *property, bool readOnly);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QString &val);
    void regExpChanged(QtProperty *property, const QRegExp &regExp);
    void echoModeChanged(QtProperty *property, const int);
    void readOnlyChanged(QtProperty *property, bool);

protected:
    QString valueText(const QtProperty *property) const;
    QString displayText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtStringPropertyManager(const QtStringPropertyManager &);
    QtStringPropertyManager &operator=(const QtStringPropertyManager &);
};




class QtDatePropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtDatePropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtDatePropertyManager();

    QDate value(const QtProperty *property) const;
    QDate minimum(const QtProperty *property) const;
    QDate maximum(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QDate &val);
    void setMinimum(QtProperty *property, const QDate &minVal);
    void setMaximum(QtProperty *property, const QDate &maxVal);
    void setRange(QtProperty *property, const QDate &minVal, const QDate &maxVal);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QDate &val);
    void rangeChanged(QtProperty *property, const QDate &minVal, const QDate &maxVal);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtDatePropertyManager(const QtDatePropertyManager &);
    QtDatePropertyManager &operator=(const QtDatePropertyManager &);
};



class QtTimePropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtTimePropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtTimePropertyManager();

    QTime value(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QTime &val);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QTime &val);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtTimePropertyManager(const QtTimePropertyManager &);
    QtTimePropertyManager &operator=(const QtTimePropertyManager &);
};




class QtDateTimePropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtDateTimePropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtDateTimePropertyManager();
    QDateTime value(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QDateTime &val);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QDateTime &val);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtDateTimePropertyManager(const QtDateTimePropertyManager &);
    QtDateTimePropertyManager &operator=(const QtDateTimePropertyManager &);
};




class QtKeySequencePropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtKeySequencePropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtKeySequencePropertyManager();
    QKeySequence value(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QKeySequence &val);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QKeySequence &val);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtKeySequencePropertyManager(const QtKeySequencePropertyManager &);
    QtKeySequencePropertyManager &operator=(const QtKeySequencePropertyManager &);
};




class QtCharPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtCharPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtCharPropertyManager();
    QChar value(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QChar &val);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QChar &val);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtCharPropertyManager(const QtCharPropertyManager &);
    QtCharPropertyManager &operator=(const QtCharPropertyManager &);
};




class QtLocalePropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtLocalePropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtLocalePropertyManager();
    QtEnumPropertyManager *subEnumPropertyManager() const;
    QLocale value(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QLocale &val);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QLocale &val);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtLocalePropertyManager(const QtLocalePropertyManager &);
    QtLocalePropertyManager &operator=(const QtLocalePropertyManager &);
};




class QtPointPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtPointPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtPointPropertyManager();
    QtIntPropertyManager *subIntPropertyManager() const;
    QPoint value(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QPoint &val);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QPoint &val);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtPointPropertyManager(const QtPointPropertyManager &);
    QtPointPropertyManager &operator=(const QtPointPropertyManager &);
};




class QtPointFPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtPointFPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtPointFPropertyManager();
    QtDoublePropertyManager *subDoublePropertyManager() const;
    QPointF value(const QtProperty *property) const;
    int decimals(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QPointF &val);
    void setDecimals(QtProperty *property, int prec);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QPointF &val);
    void decimalsChanged(QtProperty *property, int prec);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtPointFPropertyManager(const QtPointFPropertyManager &);
    QtPointFPropertyManager &operator=(const QtPointFPropertyManager &);
};




class QtSizePropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtSizePropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtSizePropertyManager();
    QtIntPropertyManager *subIntPropertyManager() const;
    QSize value(const QtProperty *property) const;
    QSize minimum(const QtProperty *property) const;
    QSize maximum(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QSize &val);
    void setMinimum(QtProperty *property, const QSize &minVal);
    void setMaximum(QtProperty *property, const QSize &maxVal);
    void setRange(QtProperty *property, const QSize &minVal, const QSize &maxVal);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QSize &val);
    void rangeChanged(QtProperty *property, const QSize &minVal, const QSize &maxVal);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtSizePropertyManager(const QtSizePropertyManager &);
    QtSizePropertyManager &operator=(const QtSizePropertyManager &);
};




class QtSizeFPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtSizeFPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtSizeFPropertyManager();
    QtDoublePropertyManager *subDoublePropertyManager() const;
    QSizeF value(const QtProperty *property) const;
    QSizeF minimum(const QtProperty *property) const;
    QSizeF maximum(const QtProperty *property) const;
    int decimals(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QSizeF &val);
    void setMinimum(QtProperty *property, const QSizeF &minVal);
    void setMaximum(QtProperty *property, const QSizeF &maxVal);
    void setRange(QtProperty *property, const QSizeF &minVal, const QSizeF &maxVal);
    void setDecimals(QtProperty *property, int prec);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QSizeF &val);
    void rangeChanged(QtProperty *property, const QSizeF &minVal, const QSizeF &maxVal);
    void decimalsChanged(QtProperty *property, int prec);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtSizeFPropertyManager(const QtSizeFPropertyManager &);
    QtSizeFPropertyManager &operator=(const QtSizeFPropertyManager &);
};




class QtRectPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtRectPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtRectPropertyManager();
    QtIntPropertyManager *subIntPropertyManager() const;
    QRect value(const QtProperty *property) const;
    QRect constraint(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QRect &val);
    void setConstraint(QtProperty *property, const QRect &constraint);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QRect &val);
    void constraintChanged(QtProperty *property, const QRect &constraint);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtRectPropertyManager(const QtRectPropertyManager &);
    QtRectPropertyManager &operator=(const QtRectPropertyManager &);
};




class QtRectFPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtRectFPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtRectFPropertyManager();
    QtDoublePropertyManager *subDoublePropertyManager() const;
    QRectF value(const QtProperty *property) const;
    QRectF constraint(const QtProperty *property) const;
    int decimals(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QRectF &val);
    void setConstraint(QtProperty *property, const QRectF &constraint);
    void setDecimals(QtProperty *property, int prec);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QRectF &val);
    void constraintChanged(QtProperty *property, const QRectF &constraint);
    void decimalsChanged(QtProperty *property, int prec);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtRectFPropertyManager(const QtRectFPropertyManager &);
    QtRectFPropertyManager &operator=(const QtRectFPropertyManager &);
};




class QtEnumPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtEnumPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtEnumPropertyManager();
    int value(const QtProperty *property) const;
    QStringList enumNames(const QtProperty *property) const;
    QMap<int, QIcon> enumIcons(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, int val);
    void setEnumNames(QtProperty *property, const QStringList &names);
    void setEnumIcons(QtProperty *property, const QMap<int, QIcon> &icons);

Q_SIGNALS:
    void valueChanged(QtProperty *property, int val);
    void enumNamesChanged(QtProperty *property, const QStringList &names);
    void enumIconsChanged(QtProperty *property, const QMap<int, QIcon> &icons);

protected:
    QString valueText(const QtProperty *property) const;
    QIcon valueIcon(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtEnumPropertyManager(const QtEnumPropertyManager &);
    QtEnumPropertyManager &operator=(const QtEnumPropertyManager &);
};




class QtFlagPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtFlagPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtFlagPropertyManager();
    QtBoolPropertyManager *subBoolPropertyManager() const;
    int value(const QtProperty *property) const;
    QStringList flagNames(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, int val);
    void setFlagNames(QtProperty *property, const QStringList &names);

Q_SIGNALS:
    void valueChanged(QtProperty *property, int val);
    void flagNamesChanged(QtProperty *property, const QStringList &names);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtFlagPropertyManager(const QtFlagPropertyManager &);
    QtFlagPropertyManager &operator=(const QtFlagPropertyManager &);
};




class QtSizePolicyPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtSizePolicyPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtSizePolicyPropertyManager();
    QtIntPropertyManager *subIntPropertyManager() const;
    QtEnumPropertyManager *subEnumPropertyManager() const;
    QSizePolicy value(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QSizePolicy &val);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QSizePolicy &val);

protected:
    QString valueText(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtSizePolicyPropertyManager(const QtSizePolicyPropertyManager &);
    QtSizePolicyPropertyManager &operator=(const QtSizePolicyPropertyManager &);
};




class QtFontPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtFontPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtFontPropertyManager();
    QtIntPropertyManager *subIntPropertyManager() const;
    QtEnumPropertyManager *subEnumPropertyManager() const;
    QtBoolPropertyManager *subBoolPropertyManager() const;
    QFont value(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QFont &val);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QFont &val);

protected:
    QString valueText(const QtProperty *property) const;
    QIcon valueIcon(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtFontPropertyManager(const QtFontPropertyManager &);
    QtFontPropertyManager &operator=(const QtFontPropertyManager &);
};




class QtColorPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtColorPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtColorPropertyManager();
    QtIntPropertyManager *subIntPropertyManager() const;
    QColor value(const QtProperty *property) const;

public Q_SLOTS:
    void setValue(QtProperty *property, const QColor &val);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QColor &val);

protected:
    QString valueText(const QtProperty *property) const;
    QIcon valueIcon(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtColorPropertyManager(const QtColorPropertyManager &);
    QtColorPropertyManager &operator=(const QtColorPropertyManager &);
};




class QtCursorPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtpropertymanager.h"
%End

public:
    QtCursorPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtCursorPropertyManager();

//%If (QT_NO_CURSOR)
//    QCursor value(const QtProperty *property) const;
//%End

public Q_SLOTS:
    void setValue(QtProperty *property, const QCursor &val);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QCursor &val);

protected:
    QString valueText(const QtProperty *property) const;
    QIcon valueIcon(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);

private:
    QtCursorPropertyManager(const QtCursorPropertyManager &);
    QtCursorPropertyManager &operator=(const QtCursorPropertyManager &);
};

