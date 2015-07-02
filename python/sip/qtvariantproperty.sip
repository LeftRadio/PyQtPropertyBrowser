// ***************************************************************************
// **
// ** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
// ** Contact: http://www.qt-project.org/legal
// **
// ** This file is part of the Qt Solutions component.
// **
// ** $QT_BEGIN_LICENSE:BSD$
// ** You may use this file under the terms of the BSD license as follows:
// **
// ** "Redistribution and use in source and binary forms, with or without
// ** modification, are permitted provided that the following conditions are
// ** met:
// **   * Redistributions of source code must retain the above copyright
// **     notice, this list of conditions and the following disclaimer.
// **   * Redistributions in binary form must reproduce the above copyright
// **     notice, this list of conditions and the following disclaimer in
// **     the documentation and/or other materials provided with the
// **     distribution.
// **   * Neither the name of Digia Plc and its Subsidiary(-ies) nor the names
// **     of its contributors may be used to endorse or promote products derived
// **     from this software without specific prior written permission.
// **
// **
// ** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// ** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// ** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// ** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// ** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// ** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// ** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// ** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// ** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// ** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// ** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
// **
// ** $QT_END_LICENSE$
// **
// ***************************************************************************




class QtVariantProperty : QtProperty
{
%TypeHeaderCode
#include "qtvariantproperty.h"
%End

public:
    ~QtVariantProperty();
    QVariant value() const;
    QVariant attributeValue(const QString &attribute) const;
    int valueType() const;
    int propertyType() const;

    void setValue(const QVariant &value);
    void setAttribute(const QString &attribute, const QVariant &value);

protected:
    QtVariantProperty(QtVariantPropertyManager *manager);

private:
    QtVariantProperty(const QtVariantProperty &);
    QtVariantProperty &operator=(const QtVariantProperty &);
};




class QtVariantPropertyManager : QtAbstractPropertyManager
{
%TypeHeaderCode
#include "qtvariantproperty.h"
%End

public:
    QtVariantPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtVariantPropertyManager();

    virtual QtVariantProperty *addProperty(int propertyType, const QString &name = QString());

    int propertyType(const QtProperty *property) const;
    int valueType(const QtProperty *property) const;
    QtVariantProperty *variantProperty(const QtProperty *property) const;

    virtual bool isPropertyTypeSupported(int propertyType) const;
    virtual int valueType(int propertyType) const;
    virtual QStringList attributes(int propertyType) const;
    virtual int attributeType(int propertyType, const QString &attribute) const;

    virtual QVariant value(const QtProperty *property) const;
    virtual QVariant attributeValue(const QtProperty *property, const QString &attribute) const;

    static int enumTypeId();
    static int flagTypeId();
    static int groupTypeId();
    static int iconMapTypeId();

public Q_SLOTS:
    virtual void setValue(QtProperty *property, const QVariant &val);
    virtual void setAttribute(QtProperty *property,
                const QString &attribute, const QVariant &value);

Q_SIGNALS:
    void valueChanged(QtProperty *property, const QVariant &val);
    void attributeChanged(QtProperty *property, const QString &attribute, const QVariant &val);

protected:
    virtual bool hasValue(const QtProperty *property) const;
    QString valueText(const QtProperty *property) const;
    QIcon valueIcon(const QtProperty *property) const;
    virtual void initializeProperty(QtProperty *property);
    virtual void uninitializeProperty(QtProperty *property);
    virtual QtProperty *createProperty();

private:
    QtVariantPropertyManager(const QtVariantPropertyManager &);
    QtVariantPropertyManager &operator=(const QtVariantPropertyManager &);
};




class QtVariantEditorFactory : QtVariantPropertyManager
{
%TypeHeaderCode
#include "qtvariantproperty.h"
%End

public:
    QtVariantEditorFactory(QObject *parent /TransferThis/ = 0);
    ~QtVariantEditorFactory();

protected:
    void connectPropertyManager(QtVariantPropertyManager *manager);
    QWidget *createEditor(QtVariantPropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtVariantPropertyManager *manager);

private:
    QtVariantEditorFactory(const QtVariantEditorFactory &);
    QtVariantEditorFactory &operator=(const QtVariantEditorFactory &);
};
