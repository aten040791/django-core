from ..dtos.participant_dto import ParticipantDTO
from ..models import Participant

class ParticipantMapper:
    @staticmethod
    def to_dto(participant): 
        dto = ParticipantDTO(
            phone_number=participant.phone_number,
            full_name=participant.full_name,
            email=participant.email,
            events=[
                {"id": ep.event.event_id, "name": ep.event.event_name}
                for ep in participant.events.select_related('event').all()
            ]
        )
        return dto.to_with_relationship()
    
    @classmethod
    def to_list_dto(self, list_participant):
        return [self.to_dto(participant) for participant in list_participant]

    @staticmethod
    def from_dto(dto, participant=None):
        if participant is None:
            participant = Participant()
        participant.phone_number = dto.phone_number
        participant.full_name = dto.full_name
        participant.email = dto.email
        return participant