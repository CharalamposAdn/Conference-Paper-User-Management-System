# Conference-Paper-User-Management-System

321-4002 – Software Engineering
Team Project for Three Member Teams
Delivery Deadline: 14/01/2023
GOALS
The main goal of this software project is to enable students to participate and receive relative 
experience in the cooperative development of software systems. A special emphasis is put on all the 
activities of the software development process and especially the requirements engineering, design, 
implementation and testing ones. In addition, an important attention is given to the use of particular 
technologies that promote cooperation, construction automation, dependency management and unit 
testing, such as Maven, Git & Junit. Finally, a special focus is made on the development of serviceoriented systems, which include one or more RESTful services, through the assistance of the Jersey 
framework. 
PROJECT TOPIC
FUNCTIONS / REQUIREMENTS
You need to develop the backend of a conference management system and a user management 
system through implementing relevant RESTful web services, which will interconnect with an 
underlying database for the proper management of all the conference-related entities. The main 
functionality to be supported by this backend will concern the management of conferences, of papers 
(i.e., manuscripts) submitted to these conferences and of users (managing conferences and papers). 
Please note that the management of a conference goes until the final acceptance of its papers and 
does not include further activities (like conference registration). 
Paper management must include the following functions:
• Paper creation: creation of a new paper. The paper should belong only to a specific
conference. For accepting this paper creation, the paper title should be unique and all
obligatory information about the paper should be supplied. Further, the name of the 
requestor (paper creator) must be included in the name of authors of the paper. The paper
id (identifier) and its creation date must be automatically produced by the backend while the 
requestor must be given the user role of AUTHOR for the specific conference.
• Paper update: the information about a paper can be updated. This can include information, 
such as the title, abstract, authors, keywords and main content of the paper. 
• Co-author addition: The paper’s author can indicate whether another user of the system can 
manage the paper. This user’s name should be included in the paper’s author names in order 
for this addition to be accepted. Once the addition is accepted, the added user must be given
the user role of AUTHOR for the specific conference.
• Paper submission: once a paper’s information has been completed, it can be formally 
submitted to the conference. The submission can be acceptable only if the conference has a 
suitable state (the SUBMISSION one), allowing such a submission, and the paper content is 
not empty. 
• Reviewer assignment: a reviewer is assigned to this paper. The reviewer assignment is 
accepted as long as the reviewer is a member of the Programme Committee (PC) of the 
conference and the maximum number of reviewers has not been already reached. Further, 
the assignment is allowed only if the conference is in the ASSIGNMENT state. The maximum 
number of reviewers is always two. 
• Paper review: a reviewer (PC member or chair) provides a score for the paper as well as a 
justification for this score. The review is accepted only if the conference is at the REVIEW 
state. 
• Paper approval: the paper is approved but it has not yet been finally accepted in the 
conference. It needs to be modified in order to address the reviewer comments. This approval 
is accepted only if the conference is at the DECISION state. 
• Paper rejection: the paper has been rejected from the conference. This rejection is accepted 
only if the conference is at the DECISION state.
• Paper final submission: the paper’s content might need to change so as to address the 
reviewer comments and the author needs to explain how this addressing has been 
performed. Once this is done, the approved paper takes its final form and can be finally 
submitted to the conference. This final submission is allowed only if the conference is at the 
FINAL_SUBMISSION state. 
• Paper acceptance: the paper has been finally accepted and can be presented in the 
conference. This acceptance is allowed only if the conference is at the FINAL state. 
• Paper search: it is allowed to search for a paper based on its title, authors and abstract. If
more than one word is given for a field, then all the words need to be included in this field for 
a paper so as to be matched. If no word is given for any of the aforementioned three criteria, 
then all the conference papers are matched. A set of papers must be returned that satisfy the
search criteria (if the latter are given). Based on the user role (see roles), this set can be
furtherfiltered before it is finally returned. The paper set to be returned must be sorted based 
on the paper title. 
• Paper view: presentation of the paper information based on its identifier. Depending on the 
user role, some fields of the paper might be discarded from the presentation.
• Paper withdraw: the paper is withdrawn from the conference and consequently deleted. 
On the other hand, the management of a conference includes the following functions:
• Conference creation: The conference is created as long as its name is unique and all of its 
obligatory information has been supplied. The conference id and creation date must be 
automatically generated by the system in this case. Further, the creator of the conference 
must be given the user role of PC CHAIR for this conference. 
• Conference update: The information about a conference can be modified. This includes the 
name and description of the conference as well as the PC committee and PC chairs. However, 
the creator of the conference cannot be removed from the PC Chairs. 
• PC Chairs addition: This includes the addition of one or more registered users as PC Chairs of 
the conference. In case a user is already a PC Chair, its addition is ignored. All the added users 
must be given the role of PC CHAIR for the conference.
• PC Members addition: This includes the addition of one or more registered users as PC 
members of the conference. In case a user is already a PC member, its addition is ignored. All 
the added users must be given the role of PC MEMBER for the conference. 
• Conference search: The user should be able to search for conferences. The search criteria can 
include only the name of the conference and its description. If more than one word is given
for a field/criterion, then all the words need to be included in this field for a conference so as 
to be matched. If no word is given for any of the aforementioned two criteria, then all the 
conferences are matched. A set of conferences must be returned that satisfy the search
criteria (if the latter are given). Based on the user role (see roles), this set can be further
filtered before it is finally returned. The conference set to be returned must be sorted based 
on the conference name.
• Conference view: Depending on the user role, some fields of the conference might be 
discarded from the presentation.
• Conference deletion: A conference can be deleted by any of its PC Chairs only if it is in its initial 
state (CREATED). 
• Submission start: The submission of papers is now allowed for the conference. The state of 
the conference transits from CREATED to SUBMISSION. 
• Reviewer assignment start: This action is permitted only if the current conference state is 
SUBMISSION. After executing this action, the state of the conference becomes ASSIGNMENT 
and the assignment of reviewers to the submitted conference papers can start. 
• Review start: This action is permitted only if the current conference state is ASSIGNMENT. 
After executing this action, the state of the conference becomes REVIEW and the review of
the submitted conference papers is allowed.
• Decision making: This action is permitted only if the current conference state is REVIEW. After 
executing this action, the state of the conference becomes DECISION and the approval or 
rejection of the submitted papers is allowed. 
• Final submission start: This action is permitted only if the current conference state is 
DECISION. After executing this action, the state of the conference becomes 
FINAL_SUBMISSION and the approved papers final submission is allowed.
• Conference end: This action is permitted only if the current conference state is 
FINAL_SUBMISSION. After executing this action, the state of the conference becomes FINAL. 
Further, the system must mark the approved papers, which have been finally submitted, as 
ACCEPTED. The approved papers that have not been finally submitted are rejected. 
User management should include the following functions:
• User registration: allows a non-registered user to request his/her registration in the system. 
All supplied user information is inserted but the user account is still inactive. The function
execution must fail if there is an existing user with the same username as the requester. For 
security reasons, the user password should be validated (use of double input for the password 
and application of a password pattern check). In case validation fails, the function execution
also fails. A password must have a size of at least 8 characters and comprise both capital and
lowercase letters, digits and special characters (e.g., !, ~, $, etc.). The username must be also
validated: it must always begin with a letter and should comprise at least 5 characters that
must be either alphanumeric or the ‘_’ one. 
• User information update: it is allowed to change all user information apart from the password. 
In case the username is changed, the current user token must be invalidated/cancelled. The
requesting user should be already authenticated. This function can be realised either by a
registered user that owns the information to be updated or the user manager. 
• User password update: a user can request the change of his/her password. In this case, the
user should provide both the old and the new password (twice the latter). In case of function
execution success, the user password must be modified. In case of three consecutive
password update failures for the same user, the user’s account must be deactivated. For
security reasons, in any case, the current user token must be always invalidated/cancelled. 
• Account status update: the user manager has the right to execute this function in order to
activate or deactivate user accounts. An inactive user account prevents the respective user
from authenticating him/herself in the system, from changing his/her user information and
from requesting the execution of any conference or paper management function. In case a
user account is deactivated, the current token of the respective user must be 
invalidated/cancelled. 
• User deletion: the user manager can execute this function or a user that requests the deletion 
of his/her account. In the context of executing this function, the user account should be
deleted as well as any token associated with it.
• User authentication: a user attempts to authenticate him/herself in the system by supplying
his/her username and password. If authentication is successful, a token must be produced
and returned so as to be utilised by the registered user in order to request the execution of 
system functions to which he/she has appropriate access. If the user already possesses an
existing token, that token should be invalidated/cancelled. In case of three consecutive failed
authentication attempts by a registered user, the respective user account must be 
deactivated.
• User token validation: this is a very crucial system function. Once a user is authenticated, 
he/she can exploit the various functions offered by the system by utilising the respective 
returned token. For every such function, through the current validation function, the system 
should check whether the token is valid, it really belongs to the requesting user and has not 
expired. In case token validation is successful, the user will have access to the requested 
function depending on his/her role(s). Otherwise, a specialised error message should be
returned depending on the actual case (e.g., invalid token, expired token, token not belonging
to current user) – obviously, many negative/unsuccessful cases can hold at the same time such 
that the error message to be returned can be complex. In case a token is valid but belongs to
another user from the requesting user, the accounts of both users must be deactivated.
Most of the system functions must be rapidly executed (at most 5-10 seconds of execution time per 
request/call). The system must be also reliable. This means that it should not exhibit internal errors 
while it needs to produce suitable error messages in case it is wrongly utilised by its users (e.g., wrong 
or invalid or incomplete input is supplied by the user in his/her request). This also means that the
system must reliably avoid performing multiple times the same successfully executed function (e.g., 
double creation of a paper) unless the function is idempotent (i.e., it always produces the same result 
as, e.g., in the case of viewing a paper). Further, the system must be secure. This means that its users 
must be authenticated and mapped to suitable roles while the access to its functions must be subject 
to suitable access (control) rules. Finally, the system must support some sort of transactionality, 
especially with respect to the data that are stored in the underlying database. In other words, there 
must be consistency in the way the database is updated while this update should be successful only if 
the corresponding system function (e.g., conference update) has been completely and properly 
executed. 
ROLES
There are 6 main user roles that need to be supported by the system:
• VISITOR: he/she is an anonymous (i.e., non-authenticated) user. A visitor can only search and 
view conferences and papers. He/she is not allowed to perform any other management 
function. The viewing is also restrained: a visitor can only see accepted papers in a conference 
and only their title, abstract, creation date and author names. Further, the visitor can only see 
basic information about a conference including its name and description as well as the names 
of PC chairs and members. 
• USER: represents an authenticated user that is not a user ADMIN. Such a user can also 
undertake the conference-specific roles of AUTHOR, PC CHAIR and PC MEMBER (see details 
below). 
• AUTHOR: he/she is an authenticated user that has either created a paper or is a co-author of 
a created paper. The role is specific to a certain conference. An author has access to the 
following functions: paper creation, updating, submission, final submission and withdrawal. 
He/she has also all the rights of a VISITOR. However, the AUTHOR can see most of the 
information about his/her papers (including content, status, review scores and comments but 
not reviewer names), irrespectively of their state.
• PC CHAIR: he/she is an authenticated user that has either created a conference or has been 
assigned as a PC chair of the conference. As such, again this is a role specific to certain 
conference. A PC Chair has all the rights of a VISITOR. However, he/she can see all the details 
about the conferences for which he/she is responsible (i.e., he/she is a PC Chair) as well as all 
the details of the papers of these conferences. Further, he/she has access to the following 
paper management functions: paper review (e.g., in case a paper has not been reviewed by 
an assigned PC member), paper approval, paper rejection and paper acceptance for the 
conferences for which he/she is responsible. Finally, he/she has access to all management 
functions for the conferences for which he/she is a PC Chair. 
• PC MEMBER: he/she is an authenticated user that can be assigned as a reviewer of one or 
more papers of a specific conference. As such, this role again is conference-specific. A PC 
member can only review a paper. He/she has also all the rights of a VISITOR. Further, he/she 
can see the content of all the papers for which he/she is assigned as a reviewer. 
• ADMIN: can manage all the registered users of the system through the functions offered by
the user management subsystem/service. He/she has also all the rights of a VISITOR.
Any registered user has permanently the role of USER apart from ADMIN user(s). As such, these two 
roles are mutually exclusive and independent of any conference. Users with role USER have the right 
to create papers or conferences. As such, they can immediately become AUTHORS or PC CHAIRS. Once 
a conference is being managed, then there is a possibility that they can become PC MEMBERS. Please 
also consider that a USER can play multiple roles even in the context of a single conference. In 
particular, he/she can be an AUTHOR as well as a PC MEMBER. However, a USER that is a PC CHAIR
for a conference cannot be an AUTHOR or a PC MEMBER for that conference. But he/she can review 
papers in that conference. As USER is mutually exclusive with ADMIN, the same holds for AUTHOR, PC 
MEMBER and PC CHAIR (are mutually exclusive with ADMIN). 
The following table summarizes the access rights of the six aforementioned roles:
Role Allowed Functions Σχόλια
VISITOR View/search papers and 
conferences
Only published papers can be 
viewed. The amount of 
information that can be viewed 
for conferences and papers is 
restrained
USER All allowed functions for 
VISITOR + other depending on 
the conference-specific roles 
undertaken by the user
See allowed functions in the 
conference-specific roles
AUTHOR All allowed functions for
VISITOR + paper creation, 
updating, submission, final 
submission and withdrawal
Can view almost all details 
about own papers or papers for 
which he/she is a co-author
PC CHAIR All allowed functions for
VISITOR + all conference 
management functions
Can view all details about the 
conferences for which he/she 
is responsible and about the 
papers in these conferences
PC MEMBER All allowed functions for
VISITOR + paper review
Can view also the content of 
papers he/she is assigned to
ADMIN All allowed functions for 
VISITOR + all user management 
functions
Please note that this is not a 
super-user role in the system
ENTITIES
The system should be in the position to manage the following 3 main entities:
• Paper: is characterised by a single identifier, which needs to be automatically produced by the
system during its creation. The same holds for the paper’s creation date, which also needs 
automatic production. A paper has a unique title, an abstract, content and author names. As 
a paper maps to users of the system as authors, it needs to be correlated with these users. 
The title, abstract, author names and user correlation are considered as obligatory 
information. The content is optional but it needs to be non-empty when the paper is 
submitted or finally submitted. The content can be a PDF or TEX (i.e., LATEX) file. Finally, a 
paper requires to have two users assigned to it (with role PC member) as its reviewers. As this 
happens late in the paper management process, this association is not initially obligatory.
Similarly, the reviewer comments and score are also not initially obligatory. 
A paper must have a specific state at any time point. The possible states are the following: (a)
CREATED, (b) SUBMITTED, (c) REVIEWED, (d) REJECTED, (e) APPROVED and (f) ACCEPTED. 
Initially, the paper state is CREATED. If the paper gets successfully submitted, it moves into 
the SUBMITTED state. If the paper is reviewed (in the SUBMITTED state), it transits to the 
REVIEWED state. If the paper is rejected (while is in the REVIEWED state), it enters the 
REJECTED state, which is final. If the paper is approved (while is in the REVIEWED state), it 
transits into the APPROVED state. Once being in APPROVED state, the paper can move into 
the REJECTED or ACCEPTED states depending on whether it is rejected or accepted, 
respectively. The ACCEPTED state is also a final state. 
• Conference: is characterised by a single identifier, which needs to be automatically produced
by the system during its creation. The same holds for the conference’s creation date, which 
also needs automatic production. A conference has a unique name and description. Initially, 
it needs to be associated to at least one PC Chair (an authenticated user). Later on, it can be 
associated to multiple other PC Chairs, if needed. Obviously, a conference needs to be 
associated to its papers. Finally, a conference should be associated with one or more PC 
members (i.e., authenticated users). The PC members set should be finalised before the 
reviewer assignment activity. Thus, after the ASSIGNMENT state of the conference, no 
changes to the PC members set is allowed. 
A conference must have a specific state at any time point. The possible states are the
following: (a) CREATED, (b) SUBMISSION, (c) ASSIGNMENT, (d) REVIEW, (e) DECISION, (f) 
FINAL_SUBMISSION and (g) FINAL. Initially, a newly created conference is at the CREATED 
state. Then it can transit to the SUBMISSION until the FINAL state sequentially in a manual 
manner through the execution of the respective conference management functions. The 
conference moves from the CREATED to the SUBMISSION state by executing the submission 
start function. Once this is done, papers can be submitted but not reviewed. The conference 
moves from SUBMISION to ASSIGNMENT state by executing the reviewer assignment start 
activity. This indicates that papers cannot be submitted any more and only reviewer 
assignments are allowed. The conference transits from ASSIGNMENT to REVIEW state by 
executing the review start function. This signifies that reviewer assignment has been finished 
and paper reviewing can proceed. The conference moves from REVIEW to DECISION state by 
executing the decision making function. This indicates that no review is then possible and only 
approval or rejection of papers is allowed. The conference moves from DECISION to 
FINAL_SUBMISSION state by executing the final submission start function. This indicates that 
all paper decisions have been made and the final submissions of approved papers can be 
conducted. Finally, the conference moves from FINAL_SUBMISSION to FINAL state by 
executing the conference end function. No more final submissions are allowed in this case. 
The approved papers that have not been finally submitted get rejected; otherwise, they 
become accepted. 
• User: must have a username and password based on which his/her authentication can be 
performed. Further, he/she must have a (full) name. Finally, he/she can have multiple roles, 
even in the context of the same conference. 
ASSUMPTIONS/CONSTRAINTS
To facilitate system implementation, the following can be assumed: 
• Token cancellation can lead to token deletion. However, you are free to decide even the 
preservation of cancelled tokens – in that case, it is better to also maintain the status of each 
token.
• To facilitate implementing the user management subsystem/service, you can assume that the
permanent role of a user does not change (i.e., it is stably either USER or ADMIN). Further, 
you can assume that ADMIN users cannot be deleted from the system for security reasons.
Finally, you can assume that ADMIN users are firstly introduced in the system and then the
system can become available for use by the users with role USER. 
• User account deactivation regards the consecutive failure of executing respective user 
management functions (e.g., authentication). This signifies the need to count these
unsuccessful attempts. Further, the notion of consecutiveness is stressed: if we have 1-2 
failures and then a success, then the number of failures is zeroed. Finally, it is highlighted that
the consecutive failing attempts must concern the same user management function or event. 
As such, it is different to have a failed authentication and different to have a failed token 
validation. 
 
First Project Part (15/100)
Based on the above analysis of the project high-level, user requirements, you must produce a set of 
detailed system requirements, both functional and non-functional. You are free to make any 
assumption in case you regard that the above analysis is vague or ambiguous, while producing the 
needed system requirements. All generated requirements need to be incorporated in the respective 
part of the report to be delivered. You can use natural or structured natural language to specify the 
needed requirements. 
Second Project Part (30/100)
Based on the extracted system requirements, you should now proceed to system design. In this case, 
you need to produce and incorporate, at the appropriate place in the report to be delivered, the
following diagrams:
• A context diagram for modelling the environment that surrounds the software system to be 
developed
• Use case diagrams to model the main use cases of the system
• A component diagram to model the system architecture
• A set of activity diagrams in order to detail the expected behaviour in the context of some of 
the modelled use cases
• A set of sequence diagrams in order to detail the expected behaviour in the context of some 
of the modelled use cases. Please note that the set of activity and sequence diagrams must 
jointly cover all the use cases modelled for the system
• An Entity-Relationship (ER) diagram or a database diagram to facilitate the design and 
implementation of the underlying database
Every incorporated diagram must be accompanied with its short textual analysis / explanation within
the report to be delivered.
Third Project Part (50/100)
Based on the system models produced in the second project part, proceed with the collaborative 
implementation of the system by utilizing any programming language you prefer. However, the use of 
the Java programming language is recommended due to its respective technologies that have been 
taught and exercised during the laboratorial part of the course. The main system functions must be 
supplied in the form of one or more RESTful services. To this end, a suitable framework for developing 
RESTful services must be adopted (such a Jersey if the implementation language is Java). 
The collaborative implementation of the system must be realised by using Git and a private repository 
in Github. In the private repository, the contributing members should be the members of the team 
and the course instructors, who need to be invited (user names: kkritikos & gchryso). Apart from the 
basic system source code, unit testing code has also to be implemented (by utilising a respective 
framework like JUnit). Finally, the use of Maven issuggested, in case Java is used as an implementation 
language, due to this ability to automatically manage the code dependencies and to automatically 
produce the artifacts for the various related software construction activities (e.g., main and test code 
packages, test reports, etc.). In case of using any other programming language apart from Java, it is 
recommended that any corresponding framework (with respect to Maven) should be adopted. 
The main deliveries for this project part must be the following: 
• The repository URL of the implemented system in Github
• Implementation documentation: what is the project structure, a class diagram, analysis of
main system classes, instructions on how to compile, package and execute the system code, 
which are the prerequisite systems/software packages (e.g., web/servlet containers, database 
servers) that must be already installed in the underlying operating system, SQL scripts for 
database/table generation. 
• Test documentation: on which system parts did the testing focus, which test cases were
covered, special preconditions or dependencies that are required for executing the unit tests
All these deliveries must be incorporated on the right place of the report to be delivered. 
REPORT (5/100)
Apart from the aforementioned project parts with specific deliveries to be incorporated in the final
project report to deliver, this report must also include additional parts, which will be graded with
5/100. 
The report structure in terms of its main chapters/units must be the following:
1. Cover Page
2. Summary: mustsummarise the main functions and features of the system under development
and the respective system environment
3. Organisation: you need to stress the following: 
a. Which were the basic roles in the development and which members of the team 
played what roles
b. The basic development activities/stages conducted/followed (obviously, they map to 
the first three project parts) as well as the activities duration and total project 
development time (in hours)
4. Requirements (first project part): you must organise this chapter into two sections, one 
section for the functional and one for the non-functional requirements. The requirements
should be numbered in a hierarchical manner in each section.
5. Design (second project part): this chapter must be organized into the following sections:
a. System Architecture and Context: supply and shortly explain the component diagram
and context diagram of the system to be developed
b. Use Cases: supply and shortly explain the use cases (diagrams) for the system to be 
developed
c. System Behaviour: supply and shortly explain activity and sequence diagrams, 
detailing the user-system interactions and system behaviour in the context of the use 
cases to be supported
d. System Entities: supply and shortly explain the system’s ER / database diagram
6. Implementation (third project part): this chapter must be organized into the following 
sections:
a. Github. Project repository URL in GitHub και contributors. Special repository settings
(if applicable). Flow of working in Git and basic development branches during system 
implementation
b. Implementation Documentation
c. Test Documentation
7. Conclusions: 
a. The experience attained from this project
b. The problems and obstacles that were faced
c. Best practices that were followed or had to be followed, which could be (also) applied
in your future (software development) projects
SUBMISSION INSTRUCTIONS
One of the three members of the team must submit the final report in the related project of the
course’s eclass (deadline: until 14/01/2023). The report format can be WORD (.doc(x)) or PDF (.pdf). 
The name of the report file to be submitted must follow the following pattern: 
<AM1>_<AM2>_<AM3>_report.<ending> where <AM1>, <AM2>, <AM3> are the matriculation 
numbers of the three team members, respectively and <ending> is the report file’s ending based on 
its format. 
The project will be remotely examined via Zoom. Instructions for this examination will be supplied via
a related announcement to be posted in the course’s eclass.
