####################### src/openshot.i (libopenshot) ########################
# @brief SWIG configuration for libopenshot (to generate Ruby SWIG bindings)
# @author Jonathan Thomas <jonathan@openshot.org>
#
# @section LICENSE
#
# Copyright (c) 2008-2014 OpenShot Studios, LLC
# <http://www.openshotstudios.com/>. This file is part of
# OpenShot Library (libopenshot), an open-source project dedicated to 
# delivering high quality video editing and animation solutions to the 
# world. For more information visit <http://www.openshot.org/>.
#
# OpenShot Library (libopenshot) is free software: you can redistribute it
# and/or modify it under the terms of the GNU Affero General Public License
# as published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# OpenShot Library (libopenshot) is distributed in the hope that it will be
# useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with OpenShot Library. If not, see <http://www.gnu.org/licenses/>.
#
# Also, if your software can interact with users remotely through a computer
# network, you should also make sure that it provides a way for users to
# get its source. For example, if your program is a web application, its
# interface could display a "Source" link that leads users to an archive
# of the code. There are many ways you could offer source, and different
# solutions will be better for different programs; see section 13 for the
# specific requirements.
#
# You should also get your employer (if you work as a programmer) or 
# school, if any, to sign a "copyright disclaimer" for the program, if necessary.
# For more information on this, and how to apply and follow the GNU AGPL, see
# <http://www.gnu.org/licenses/>.
################################################################################


%module openshot

/* Enable inline documentation */
%feature("autodoc", "1");

/* Include various SWIG helpers */
%include "typemaps.i"
%include "std_string.i"
%include "std_list.i"
%include "std_vector.i"

/* Unhandled STL Exception Handling */
%include <std_except.i>

namespace std {
namespace tr1
{
  template<class T> class shared_ptr {
  public:
    T *operator->();
  };
}}

/* Mark these classes as shared_ptr classes */
%template(SPtrImage) std::tr1::shared_ptr<Magick::Image>;
%template(SPtrAudioBuffer) std::tr1::shared_ptr<juce::AudioSampleBuffer>;
%template(SPtrOpenFrame) std::tr1::shared_ptr<openshot::Frame>;
%template(SPtrFrame) std::tr1::shared_ptr<Frame>;


%{
#include "../../../include/Version.h"
#include "../../../include/ReaderBase.h"
#include "../../../include/WriterBase.h"
#include "../../../include/Cache.h"
#include "../../../include/ChunkReader.h"
#include "../../../include/ChunkWriter.h"
#include "../../../include/ClipBase.h"
#include "../../../include/Clip.h"
#include "../../../include/Coordinate.h"
#include "../../../include/Color.h"
#include "../../../include/DummyReader.h"
#include "../../../include/EffectBase.h"
#include "../../../include/Effects.h"
#include "../../../include/Exceptions.h"
#include "../../../include/FFmpegReader.h"
#include "../../../include/FFmpegWriter.h"
#include "../../../include/Fraction.h"
#include "../../../include/Frame.h"
#include "../../../include/FrameMapper.h"
#include "../../../include/ImageReader.h"
#include "../../../include/PlayerBase.h"
#include "../../../include/Point.h"
#include "../../../include/Profiles.h"
#include "../../../include/QtPlayer.h"
#include "../../../include/KeyFrame.h"
#include "../../../include/RendererBase.h"
#include "../../../include/SDLPlayer.h"
#include "../../../include/TextReader.h"
#include "../../../include/Timeline.h"

%}

#ifdef USE_BLACKMAGIC
	%{
		#include "../../../include/DecklinkReader.h"
		#include "../../../include/DecklinkWriter.h"
	%}
#endif


%include "../../../include/Version.h"
%include "../../../include/ReaderBase.h"
%include "../../../include/WriterBase.h"
%include "../../../include/Cache.h"
%include "../../../include/ChunkReader.h"
%include "../../../include/ChunkWriter.h"
%include "../../../include/ClipBase.h"
%include "../../../include/Clip.h"
%include "../../../include/Coordinate.h"
%include "../../../include/Color.h"
#ifdef USE_BLACKMAGIC
	%include "../../../include/DecklinkReader.h"
	%include "../../../include/DecklinkWriter.h"
#endif
%include "../../../include/DummyReader.h"
%include "../../../include/EffectBase.h"
%include "../../../include/Exceptions.h"
%include "../../../include/FFmpegReader.h"
%include "../../../include/FFmpegWriter.h"
%include "../../../include/Fraction.h"
%include "../../../include/Frame.h"
%include "../../../include/FrameMapper.h"
%include "../../../include/ImageReader.h"
%include "../../../include/PlayerBase.h"
%include "../../../include/Point.h"
%include "../../../include/Profiles.h"
%include "../../../include/QtPlayer.h"
%include "../../../include/KeyFrame.h"
%include "../../../include/RendererBase.h"
%include "../../../include/SDLPlayer.h"
%include "../../../include/TextReader.h"
%include "../../../include/Timeline.h"

/* Effects */
%include "../../../include/effects/ChromaKey.h"
%include "../../../include/effects/Deinterlace.h"
%include "../../../include/effects/Mask.h"
%include "../../../include/effects/Negate.h"


/* Wrap std templates (list, vector, etc...) */
namespace std {
 %template(ClipList) list<Clip *>;
 %template(EffectBaseList) list<EffectBase *>;
 %template(CoordinateVector) vector<Coordinate>;
 %template(PointsVector) vector<Point>;
 %template(FieldVector) vector<Field>;
 %template(MappedFrameVector) vector<MappedFrame>;
}