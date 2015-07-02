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


//QtAbstractEditorFactory
class QtSpinBoxFactory : QtIntPropertyManager /Abstract/
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtSpinBoxFactory(QObject *parent /TransferThis/ = 0);
    ~QtSpinBoxFactory();

protected:
    void connectPropertyManager(QtIntPropertyManager *manager);
    QWidget *createEditor(QtIntPropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtIntPropertyManager *manager);

private:
    QtSpinBoxFactory(const QtSpinBoxFactory &);
    QtSpinBoxFactory &operator=(const QtSpinBoxFactory &);
};


class QtSliderFactory : QtIntPropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtSliderFactory(QObject *parent /TransferThis/ = 0);
    ~QtSliderFactory();

protected:
    void connectPropertyManager(QtIntPropertyManager *manager);
    QWidget *createEditor(QtIntPropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtIntPropertyManager *manager);

private:
    QtSliderFactory(const QtSliderFactory &);
    QtSliderFactory &operator=(const QtSliderFactory &);
};


class QtScrollBarFactory : QtIntPropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtScrollBarFactory(QObject *parent /TransferThis/ = 0);
    ~QtScrollBarFactory();

protected:
    void connectPropertyManager(QtIntPropertyManager *manager);
    QWidget *createEditor(QtIntPropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtIntPropertyManager *manager);

private:
    QtScrollBarFactory(const QtScrollBarFactory &);
    QtScrollBarFactory &operator=(const QtScrollBarFactory &);
};


class QtCheckBoxFactory : QtBoolPropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtCheckBoxFactory(QObject *parent /TransferThis/ = 0);
    ~QtCheckBoxFactory();

protected:
    void connectPropertyManager(QtBoolPropertyManager *manager);
    QWidget *createEditor(QtBoolPropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtBoolPropertyManager *manager);

private:
    QtCheckBoxFactory(const QtCheckBoxFactory &);
    QtCheckBoxFactory &operator=(const QtCheckBoxFactory &);
};


class QtDoubleSpinBoxFactory : QtDoublePropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtDoubleSpinBoxFactory(QObject *parent /TransferThis/ = 0);
    ~QtDoubleSpinBoxFactory();

protected:
    void connectPropertyManager(QtDoublePropertyManager *manager);
    QWidget *createEditor(QtDoublePropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtDoublePropertyManager *manager);

private:
    QtDoubleSpinBoxFactory(const QtDoubleSpinBoxFactory &);
    QtDoubleSpinBoxFactory &operator=(const QtDoubleSpinBoxFactory &);
};


class QtLineEditFactory : QtStringPropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtLineEditFactory(QObject *parent /TransferThis/ = 0);
    ~QtLineEditFactory();

protected:
    void connectPropertyManager(QtStringPropertyManager *manager);
    QWidget *createEditor(QtStringPropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtStringPropertyManager *manager);

private:
    QtLineEditFactory(const QtLineEditFactory &);
    QtLineEditFactory &operator=(const QtLineEditFactory &);
};


class QtDateEditFactory : QtDatePropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtDateEditFactory(QObject *parent /TransferThis/ = 0);
    ~QtDateEditFactory();

protected:
    void connectPropertyManager(QtDatePropertyManager *manager);
    QWidget *createEditor(QtDatePropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtDatePropertyManager *manager);

private:
    QtDateEditFactory(const QtDateEditFactory &);
    QtDateEditFactory &operator=(const QtDateEditFactory &);
};


class QtTimeEditFactory : QtTimePropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtTimeEditFactory(QObject *parent /TransferThis/ = 0);
    ~QtTimeEditFactory();

protected:
    void connectPropertyManager(QtTimePropertyManager *manager);
    QWidget *createEditor(QtTimePropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtTimePropertyManager *manager);

private:
    QtTimeEditFactory(const QtTimeEditFactory &);
    QtTimeEditFactory &operator=(const QtTimeEditFactory &);
};


class QtDateTimeEditFactory : QtDateTimePropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtDateTimeEditFactory(QObject *parent /TransferThis/ = 0);
    ~QtDateTimeEditFactory();

protected:
    void connectPropertyManager(QtDateTimePropertyManager *manager);
    QWidget *createEditor(QtDateTimePropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtDateTimePropertyManager *manager);

private:
    QtDateTimeEditFactory(const QtDateTimeEditFactory &);
    QtDateTimeEditFactory &operator=(const QtDateTimeEditFactory &);
};


class QtKeySequenceEditorFactory : QtKeySequencePropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtKeySequenceEditorFactory(QObject *parent /TransferThis/ = 0);
    ~QtKeySequenceEditorFactory();

protected:
    void connectPropertyManager(QtKeySequencePropertyManager *manager);
    QWidget *createEditor(QtKeySequencePropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtKeySequencePropertyManager *manager);

private:
    QtKeySequenceEditorFactory(const QtKeySequenceEditorFactory &);
    QtKeySequenceEditorFactory &operator=(const QtKeySequenceEditorFactory &);
};




class QtCharEditorFactory : QtCharPropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtCharEditorFactory(QObject *parent /TransferThis/ = 0);
    ~QtCharEditorFactory();

protected:
    void connectPropertyManager(QtCharPropertyManager *manager);
    QWidget *createEditor(QtCharPropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtCharPropertyManager *manager);

private:
    QtCharEditorFactory(const QtCharEditorFactory &);
    QtCharEditorFactory &operator=(const QtCharEditorFactory &);
};


class QtEnumEditorFactory : QtEnumPropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtEnumEditorFactory(QObject *parent /TransferThis/ = 0);
    ~QtEnumEditorFactory();

protected:
    void connectPropertyManager(QtEnumPropertyManager *manager);
    QWidget *createEditor(QtEnumPropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtEnumPropertyManager *manager);

private:
    QtEnumEditorFactory(const QtEnumEditorFactory &);
    QtEnumEditorFactory &operator=(const QtEnumEditorFactory &);
};


class QtCursorEditorFactory : QtCursorPropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtCursorEditorFactory(QObject *parent /TransferThis/ = 0);
    ~QtCursorEditorFactory();

protected:
    void connectPropertyManager(QtCursorPropertyManager *manager);
    QWidget *createEditor(QtCursorPropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtCursorPropertyManager *manager);

private:
    QtCursorEditorFactory(const QtCursorEditorFactory &);
    QtCursorEditorFactory &operator=(const QtCursorEditorFactory &);
};


class QtColorEditorFactory : QtColorPropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtColorEditorFactory(QObject *parent /TransferThis/ = 0);
    ~QtColorEditorFactory();

protected:
    void connectPropertyManager(QtColorPropertyManager *manager);
    QWidget *createEditor(QtColorPropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtColorPropertyManager *manager);

private:
    QtColorEditorFactory(const QtColorEditorFactory &);
    QtColorEditorFactory &operator=(const QtColorEditorFactory &);
};


class QtFontEditorFactory : QtFontPropertyManager
{
%TypeHeaderCode
#include "qteditorfactory.h"
%End

public:
    QtFontEditorFactory(QObject *parent /TransferThis/ = 0);
    ~QtFontEditorFactory();

protected:
    void connectPropertyManager(QtFontPropertyManager *manager);
    QWidget *createEditor(QtFontPropertyManager *manager, QtProperty *property, QWidget *parent);
    void disconnectPropertyManager(QtFontPropertyManager *manager);

private:
    QtFontEditorFactory(const QtFontEditorFactory &);
    QtFontEditorFactory &operator=(const QtFontEditorFactory &);
};


