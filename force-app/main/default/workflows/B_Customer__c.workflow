<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Phone_number_update_email</fullName>
        <ccEmails>tallajayakumar@gmail.com</ccEmails>
        <description>Phone number update email</description>
        <protected>false</protected>
        <recipients>
            <field>Customer_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/contact_number_update_1634040470458</template>
    </alerts>
    <rules>
        <fullName>Customer phone update email</fullName>
        <actions>
            <name>Phone_number_update_email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>B_Customer__c.Mobile_Number__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>temp</fullName>
        <active>false</active>
        <criteriaItems>
            <field>B_Customer__c.Customer_Email__c</field>
            <operation>equals</operation>
            <value>tallajayakumar@gmail.com</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
