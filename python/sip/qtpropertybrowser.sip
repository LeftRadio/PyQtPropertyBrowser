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



typedef QLineEdit::EchoMode EchoMode;


class QtProperty
{
%TypeHeaderCode
#include "qtpropertybrowser.h"
%End

public:
    virtual ~QtProperty();
    QList<QtProperty *> subProperties() const;
    QtAbstractPropertyManager *propertyManager() const;

    QString toolTip() const;
    QString statusTip() const;
    QString whatsThis() const;
    QString propertyName() const;
    bool isEnabled() const;
    bool isModified() const;

    bool hasValue() const;
    QIcon valueIcon() const;
    QString valueText() const;
    QString displayText() const;

    void setToolTip(const QString &text);
    void setStatusTip(const QString &text);
    void setWhatsThis(const QString &text);
    void setPropertyName(const QString &text);
    void setEnabled(bool enable);
    void setModified(bool modified);

    void addSubProperty(QtProperty *property);
    void insertSubProperty(QtProperty *property, QtProperty *afterProperty);
    void removeSubProperty(QtProperty *property);

protected:
    explicit QtProperty(QtAbstractPropertyManager *manager);
    void propertyChanged();

private:
    QtProperty(const QtProperty &);
    QtProperty &operator=(const QtProperty &);
};



class QtAbstractPropertyManager : QObject
{
%TypeHeaderCode
#include "qtpropertybrowser.h"
%End

public:
    explicit QtAbstractPropertyManager(QObject *parent /TransferThis/ = 0);
    ~QtAbstractPropertyManager();
    QSet<QtProperty *> properties() const;
    void clear() const;
    QtProperty *addProperty(const QString &name /TransferThis/ = QString());

signals:
    void propertyInserted(QtProperty *property, QtProperty *parent, QtProperty *after);
    void propertyChanged(QtProperty *property);
    void propertyRemoved(QtProperty *property, QtProperty *parent);
    void propertyDestroyed(QtProperty *property);

protected:
    virtual bool hasValue(const QtProperty *property) const;
    virtual QIcon valueIcon(const QtProperty *property) const;
    virtual QString valueText(const QtProperty *property) const;
    virtual QString displayText(const QtProperty *property) const;
    virtual EchoMode echoMode(const QtProperty *) const;
    virtual void initializeProperty(QtProperty *property) = 0;
    virtual void uninitializeProperty(QtProperty *property);
    virtual QtProperty *createProperty();

private:
    QtAbstractPropertyManager(const QtAbstractPropertyManager &);
    QtAbstractPropertyManager &operator=(const QtAbstractPropertyManager &);
};




class QtAbstractEditorFactoryBase : QObject
{
%TypeHeaderCode
#include "qtpropertybrowser.h"
%End

public:
    virtual QWidget *createEditor(QtProperty *property, QWidget *parent) = 0;

protected:
    virtual void breakConnection(QtAbstractPropertyManager *manager) = 0;

protected slots:
    virtual void managerDestroyed(QObject *manager) = 0;
};




class QtBrowserItem
{
%TypeHeaderCode
#include "qtpropertybrowser.h"
%End

public:
    QtProperty *property() const;
    QtBrowserItem *parent() const;
    QList<QtBrowserItem *> children() const;
    QtAbstractPropertyBrowser *browser() const;

private:
    explicit QtBrowserItem(QtAbstractPropertyBrowser *browser, QtProperty *property, QtBrowserItem *parent);
    ~QtBrowserItem();
};




class QtAbstractPropertyBrowser : QWidget
{
%TypeHeaderCode
#include "qtpropertybrowser.h"
%End

public:
    explicit QtAbstractPropertyBrowser(QWidget *parent /TransferThis/ = 0);
    ~QtAbstractPropertyBrowser();

    QList<QtProperty *> properties() const;
    QList<QtBrowserItem *> items(QtProperty *property) const;
    QtBrowserItem *topLevelItem(QtProperty *property) const;
    QList<QtBrowserItem *> topLevelItems() const;
    void clear();

%TypeCode
    template <class PropertyManager>
    void setFactoryForManager(PropertyManager *manager,
                    QtAbstractEditorFactory<PropertyManager> *factory) {
        QtAbstractPropertyManager *abstractManager = manager;
        QtAbstractEditorFactoryBase *abstractFactory = factory;

        if (addFactory(abstractManager, abstractFactory))
            factory->addPropertyManager(manager);
    }
%End

    void unsetFactoryForManager(QtAbstractPropertyManager *manager);

    QtBrowserItem *currentItem() const;
    void setCurrentItem(QtBrowserItem *);

signals:
    void currentItemChanged(QtBrowserItem *);

public slots:
    QtBrowserItem *addProperty(QtProperty *property);
    QtBrowserItem *insertProperty(QtProperty *property, QtProperty *afterProperty);
    void removeProperty(QtProperty *property);

protected:
    virtual void itemInserted(QtBrowserItem *item, QtBrowserItem *afterItem) = 0;
    virtual void itemRemoved(QtBrowserItem *item) = 0;
    // can be tooltip, statustip, whatsthis, name, icon, text.
    virtual void itemChanged(QtBrowserItem *item) = 0;
    virtual QWidget *createEditor(QtProperty *property, QWidget *parent);

private:
    bool addFactory(QtAbstractPropertyManager *abstractManager,
                QtAbstractEditorFactoryBase *abstractFactory);

    QtAbstractPropertyBrowser(const QtAbstractPropertyBrowser &);
    QtAbstractPropertyBrowser &operator=(const QtAbstractPropertyBrowser &);
};
