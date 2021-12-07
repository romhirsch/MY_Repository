import json


class DicomTagJsonEncoder(json.JSONEncoder):

    def default(self, o):
        return o.encode()

    @staticmethod
    def decode_json(json_dict):
        dict = {}
        for key, value in json_dict.items():
            dict[key] = DicomTag.decode_json(value)
        return dict

class DicomTag:

    def __init__(self, tag_name, tag_number, vr):
        self.__tag_name = tag_name
        self.__vr = vr
        self.__tag_number = tag_number

    @staticmethod
    def decode_json(json_dict):
        json_dict = json.loads(json_dict)
        return DicomTag(json_dict["tag_name"], json_dict["tag_number"], json_dict["vr"])

    def encode(self):
        return json.dumps(
            {
                "tag_name": self.tag_name,
                "tag_number": self.tag_number,
                "vr": self.vr
            }
        )

    # Getters:
    @property
    def vr(self):
        return self.__vr

    @property
    def tag_number(self):
        return self.__tag_number

    @property
    def group(self):
        return self.__tag_number & 0xFFFF0000

    @property
    def element(self):
        return self.__tag_number & 0xFFFF

    @property
    def tag_name(self):
        return self.__tag_name

    # Setters
    @group.setter
    def group(self, value):
        raise NotImplementedError()

    @element.setter
    def element(self, value):
        raise NotImplementedError()

    @vr.setter
    def vr(self, value):
        raise NotImplementedError()

    @tag_number.setter
    def tag_number(self, value):
        raise NotImplementedError()

    @tag_name.setter
    def tag_name(self, value):
        raise NotImplementedError()


class DicomTagWithValue(DicomTag):

    def __init__(self, DicomTag, value):
        super().__init__(DicomTag.tag_name, DicomTag.tag_number, DicomTag.vr)
        self.value = value

    def __str__(self):
        return "{}, {}, {}, {}".format(self.tag_number, self.tag_name, self.vr, self.value)
