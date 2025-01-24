class ParticipantDTO:
    def __init__(self, phone_number, full_name, email, events):
        self.phone_number = phone_number
        self.full_name = full_name
        self.email = email
        self.events = events

    def to_without_relationship(self):
        return {
            "phone_number": self.phone_number,
            "full_name": self.full_name,
            "email": self.email
        }
    
    def to_with_relationship(self):
        return {
            "phone_number": self.phone_number,
            "full_name": self.full_name,
            "email": self.email,
            "events": self.events
        }