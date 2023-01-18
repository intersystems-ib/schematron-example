Class dc.schematron Extends %RegisteredObject
{

/// Description
ClassMethod simpleTest() [ Language = python ]
{
        from lxml import isoschematron
        from lxml import etree

        print("Validating File...\n")

        # def runsch(rulesFile, xmlFile):
        #open files
        rules = open('/durable/test-schema.sch', 'rb') # Schematron schema
        XMLhere = open('/durable/test-file.xml', 'rb') # XML file to check 
    
        #Parse schema
        sct_doc= etree.parse(rules)
        schematron=isoschematron.Schematron(sct_doc, store_report=True)

        #Parse XML
        doc = etree.parse(XMLhere)

        #Validate against schema
        validationResult = schematron.validate(doc)
        report = schematron._validation_report
    
        #Check result
        if validationResult:
            print("passed")
        else:
            print("failed")
            print(report)
}

}
