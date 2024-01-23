// ConferenceManagementService.java
import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.util.Optional;
import java.util.stream.Collectors;

public class ConferenceManagementService {

    private List<Conference> conferences = new ArrayList<>();

    public Conference createConference(String name, String description, String creatorUserId) {
        // Check if a conference with the same name already exists
        if (isConferenceNameUnique(name)) {
            // Generate conference ID and creation date
            String conferenceId = generateConferenceId();
            Date creationDate = new Date();

            // Create a new conference
            Conference conference = new Conference();
            conference.setId(conferenceId);
            conference.setName(name);
            conference.setDescription(description);
            conference.setCreationDate(creationDate);
            conference.setCreatorUserId(creatorUserId);
            conference.setState(ConferenceState.CREATED);

            // Set PC Chair role for the creator
            addPCChair(conference, creatorUserId);

            // Add the conference to the list of conferences
            conferences.add(conference);

            // Return the created conference
            return conference;
        } else {
            // Conference name is not unique
            // Handle the error or throw an exception
            return null;
        }
    }

    private boolean isConferenceNameUnique(String name) {
        // Check if a conference with the same name already exists
        return conferences.stream().noneMatch(conf -> conf.getName().equalsIgnoreCase(name));
    }

    private String generateConferenceId() {
        // Generate a unique conference ID (you can implement your own logic)
        return "CONF" + (conferences.size() + 1);
    }

    private void addPCChair(Conference conference, String userId) {
        // Add the user as a PC Chair for the conference
        conference.getPcChairs().add(userId);
    }



    public Conference updateConference(String conferenceId, String name, String description, String updaterUserId) {
        // Find the conference by ID
        Optional<Conference> optionalConference = findConferenceById(conferenceId);

        if (optionalConference.isPresent()) {
            Conference conference = optionalConference.get();

            // Check if the updater is a PC Chair for the conference
            if (isPCChair(conference, updaterUserId)) {
                // Ensure the creator is not removed from PC Chairs
                if (!conference.getCreatorUserId().equals(updaterUserId)) {
                    // Perform the update
                    conference.setName(name);
                    conference.setDescription(description);

                    // Update the modification date
                    conference.setModificationDate(new Date());

                    // Return the updated conference
                    return conference;
                } else {
                    // Updater is the creator, cannot remove from PC Chairs
                    // Handle the error or throw an exception
                    return null;
                }
            } else {
                // Updater is not a PC Chair, unauthorized
                // Handle the error or throw an exception
                return null;
            }
        } else {
            // Conference not found
            // Handle the error or throw an exception
            return null;
        }
    }

    private Optional<Conference> findConferenceById(String conferenceId) {
        // Find the conference by ID in the list
        return conferences.stream().filter(conf -> conf.getId().equals(conferenceId)).findFirst();
    }

    private boolean isPCChair(Conference conference, String userId) {
        // Check if the user is a PC Chair for the conference
        return conference.getPcChairs().contains(userId);
    }

    public void addPCChair(String conferenceId, String userId, String requesterUserId) {
        // Find the conference by ID
        Optional<Conference> optionalConference = findConferenceById(conferenceId);

        if (optionalConference.isPresent()) {
            Conference conference = optionalConference.get();

            // Check if the requester is a PC Chair for the conference
            if (isPCChair(conference, requesterUserId)) {
                // Check if the user is not already a PC Chair
                if (!conference.getPcChairs().contains(userId)) {
                    // Add the user as a PC Chair for the conference
                    conference.getPcChairs().add(userId);
                }
                // Ignore if the user is already a PC Chair
            } else {
                // Requester is not a PC Chair, unauthorized
                // Handle the error or throw an exception
                throw new UnauthorizedAccessException("User is not authorized to add PC Chairs.");
            }
        } else {
            // Conference not found
            // Handle the error or throw an exception
            throw new ConferenceNotFoundException("Conference not found with ID: " + conferenceId);
        }
    }

    public void addPCMember(String conferenceId, String userId, String requesterUserId) {
        // Find the conference by ID
        Optional<Conference> optionalConference = findConferenceById(conferenceId);

        if (optionalConference.isPresent()) {
            Conference conference = optionalConference.get();

            // Check if the requester is a PC Chair for the conference
            if (isPCChair(conference, requesterUserId)) {
                // Check if the user is not already a PC Member
                if (!conference.getPcMembers().contains(userId)) {
                    // Add the user as a PC Member for the conference
                    conference.getPcMembers().add(userId);
                }
                // Ignore if the user is already a PC Member
            } else {
                // Requester is not a PC Chair, unauthorized
                // Handle the error or throw an exception
                throw new UnauthorizedAccessException("User is not authorized to add PC Members.");
            }
        } else {
            // Conference not found
            // Handle the error or throw an exception
            throw new ConferenceNotFoundException("Conference not found with ID: " + conferenceId);
        }
    }

    public List<Conference> searchConferences(String name, String description, String userId) {
        // Logic to search for conferences based on criteria
        List<Conference> result = conferences.stream()
                .filter(conference -> isMatch(conference, name, description))
                .filter(conference -> hasAccess(conference, userId))
                .sorted((c1, c2) -> c1.getName().compareTo(c2.getName()))
                .collect(Collectors.toList());

        return result;
    }

    private boolean isMatch(Conference conference, String name, String description) {
        // Check if the conference matches the search criteria
        boolean nameMatch = name == null || conference.getName().contains(name);
        boolean descriptionMatch = description == null || conference.getDescription().contains(description);
        return nameMatch && descriptionMatch;
    }

    private boolean hasAccess(Conference conference, String userId) {
        return isUserAdmin(userId) || conference.getPcChairs().contains(userId) || conference.getPcMembers().contains(userId);
    }

    private boolean isUserAdmin(String userId) {
        return "admin".equals(userId);
    }

    public Conference viewConference(String conferenceId, String userId) {
        Conference conference = findConferenceById(conferenceId);

        if (conference != null) {
            if (hasAccessToView(conference, userId)) {
                return createViewableConference(conference, userId);
            } else {
                throw new AccessDeniedException("You do not have permission to view this conference.");
            }
        } else {
            throw new ConferenceNotFoundException("Conference not found with ID: " + conferenceId);
        }
    }

    private boolean hasAccessToView(Conference conference, String userId) {
        return isUserAdmin(userId) || conference.getPcChairs().contains(userId) || conference.getPcMembers().contains(userId);
    }

    private Conference createViewableConference(Conference conference, String userId) {
        return conference;
    }

    public void deleteConference(String conferenceId, String userId) {
        Conference conference = findConferenceById(conferenceId);

        if (conference != null) {
            if (hasPermissionToDelete(conference, userId)) {
                conferences.remove(conference);
            } else {
                throw new AccessDeniedException("You do not have permission to delete this conference.");
            }
        } else {
            throw new ConferenceNotFoundException("Conference not found with ID: " + conferenceId);
        }
    }

    private boolean hasPermissionToDelete(Conference conference, String userId) {
        return isUserPCChair(userId) && conference.getPcChairs().contains(userId);
    }

    public void startSubmission(String conferenceId) {
        Conference conference = findConferenceById(conferenceId);

        if (conference != null) {
            if (conference.getState() == ConferenceState.CREATED) {
                // Transition the conference state to SUBMISSION
                conference.setState(ConferenceState.SUBMISSION);
            } else {
                throw new IllegalStateException("Conference cannot start submission. Current state: " + conference.getState());
            }
        } else {
            throw new ConferenceNotFoundException("Conference not found with ID: " + conferenceId);
        }
    }

    public void startReviewerAssignment(String conferenceId) {
        Conference conference = findConferenceById(conferenceId);

        if (conference != null) {
            if (conference.getState() == ConferenceState.SUBMISSION) {
                // Transition the conference state to ASSIGNMENT
                conference.setState(ConferenceState.ASSIGNMENT);
            } else {
                throw new IllegalStateException("Reviewer assignment cannot start. Current state: " + conference.getState());
            }
        } else {
            throw new ConferenceNotFoundException("Conference not found with ID: " + conferenceId);
        }
    }

    public void startReview(String conferenceId) {
        Conference conference = findConferenceById(conferenceId);

        if (conference != null) {
            if (conference.getState() == ConferenceState.ASSIGNMENT) {
                // Transition the conference state to REVIEW
                conference.setState(ConferenceState.REVIEW);
            } else {
                throw new IllegalStateException("Review cannot start. Current state: " + conference.getState());
            }
        } else {
            throw new ConferenceNotFoundException("Conference not found with ID: " + conferenceId);
        }
    }

    public void startDecisionMaking(String conferenceId) {
        Conference conference = findConferenceById(conferenceId);

        if (conference != null) {
            if (conference.getState() == ConferenceState.REVIEW) {
                // Transition the conference state to DECISION
                conference.setState(ConferenceState.DECISION);
            } else {
                throw new IllegalStateException("Decision making cannot start. Current state: " + conference.getState());
            }
        } else {
            throw new ConferenceNotFoundException("Conference not found with ID: " + conferenceId);
        }
    }

    public void startFinalSubmission(String conferenceId) {
        Conference conference = findConferenceById(conferenceId);

        if (conference != null) {
            if (conference.getState() == ConferenceState.DECISION) {
                // Transition the conference state to FINAL_SUBMISSION
                conference.setState(ConferenceState.FINAL_SUBMISSION);
            } else {
                throw new IllegalStateException("Final submission cannot start. Current state: " + conference.getState());
            }
        } else {
            throw new ConferenceNotFoundException("Conference not found with ID: " + conferenceId);
        }
    }

    public void endConference(String conferenceId) {
        Conference conference = findConferenceById(conferenceId);

        if (conference != null) {
            if (conference.getState() == ConferenceState.FINAL_SUBMISSION) {
                // Transition the conference state to FINAL
                conference.setState(ConferenceState.FINAL);

                // Mark approved papers as ACCEPTED and reject others
                for (Paper paper : conference.getPapers()) {
                    if (paper.getState() == PaperState.APPROVED && paper.isFinallySubmitted()) {
                        paper.setState(PaperState.ACCEPTED);
                    } else {
                        paper.setState(PaperState.REJECTED);
                    }
                }
            } else {
                throw new IllegalStateException("Conference end cannot be initiated. Current state: " + conference.getState());
            }
        } else {
            throw new ConferenceNotFoundException("Conference not found with ID: " + conferenceId);
        }
    }
}

    

