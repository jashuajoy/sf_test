<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>ChangePriorityToHigh</fullName>
        <field>Priority</field>
        <literalValue>High</literalValue>
        <name>Changes the case priority to high.</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>origin_is_phone</fullName>
        <description>when case origin is phone</description>
        <field>OwnerId</field>
        <lookupValue>tjk@other.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>origin is phone</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>origin_is_web</fullName>
        <description>when case origin is web</description>
        <field>OwnerId</field>
        <lookupValue>tallajayakumar100@gmail.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>origin is web</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Community Case Creation</fullName>
        <actions>
            <name>origin_is_phone</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>origin_is_web</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>equals</operation>
            <value>00e5g0000055W90AAE</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>equals</operation>
            <value>00e5g0000053pFJAAE</value>
        </criteriaItems>
        <description>fires when case is created from community</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
