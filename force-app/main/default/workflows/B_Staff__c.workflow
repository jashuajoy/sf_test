<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Welcome_email</fullName>
        <ccEmails>tallajayakumar@gmail.com</ccEmails>
        <description>Welcome email</description>
        <protected>false</protected>
        <recipients>
            <field>Employee_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Staff_joining_welcome_email</template>
    </alerts>
    <alerts>
        <fullName>Welcome_email_notification</fullName>
        <ccEmails>tallajayakumar@gmail.com</ccEmails>
        <description>Welcome email</description>
        <protected>false</protected>
        <recipients>
            <field>Employee_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Lightning_Email_Template_staff_1634038467996</template>
    </alerts>
    <fieldUpdates>
        <fullName>Worker_location_pincode</fullName>
        <description>Assign the appropriate pincode.</description>
        <field>Work_Location_Pincode__c</field>
        <formula>Work_Location__r.Pincode__c</formula>
        <name>Worker location pincode</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>Send welcome email</fullName>
        <actions>
            <name>Welcome_email_notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>B_Staff__c.Employee_Email__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Welcome email will be sent when new staff record is created.</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>Worker location pincode assigner</fullName>
        <actions>
            <name>Worker_location_pincode</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>B_Location__c.Pincode__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
